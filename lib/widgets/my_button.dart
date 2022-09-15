import 'dart:convert';
import 'package:breast_cancer/screens/shared_pref/shared_pref_componants.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({required this.color, required this.title, required this.onPressed});

  final Color color;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: BorderRadius.circular(10),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200,
          height: 42,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

void snackBar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      style: TextStyle(fontSize: 16),
    ),
    backgroundColor: color,
  ));
}

void navigatePush(BuildContext context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateReplacement(BuildContext context, Widget widget) =>
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => widget));

Color colorLogo = Color(0xff2e386b);
Color? colorButtonpink = Colors.pink[400];

Future<bool> fetchDataLogin(String email, String password) async {
  String url = 'https://project-88f34-default-rtdb.firebaseio.com/doctors.json';
  bool x = false;
  try {
    http.Response res = await http.get(Uri.parse(url));
    final Map<String, dynamic> extractedData =
        json.decode(res.body) as Map<String, dynamic>;
    // print(json.decode(res.body));
    extractedData.forEach((key, value) {
      if (value["email"] == email && value["password"] == password) {
        SharedPrefController().setStringData(key: "email", value: value['email']);
        SharedPrefController().setStringData(key: "password", value: value['password']);
        SharedPrefController().setStringData(key: "username", value: value['username']);
        x = true;
        // print (value);
      }
    });
  } catch (error) {
    throw error;
  }
  return x;
}

Future<void> addServiceData({
  required String name,
  required String phone,
  required String date,
  required String time,
  required String doctorName,
  required String doctorPhone,
  required String doctorLocation,
}) async {
  String url =
      'https://project-88f34-default-rtdb.firebaseio.com/reservations.json';
  http.post(Uri.parse(url),
      body: json.encode({
        "name": name,
        "phone": phone,
        "date": date,
        "time": time,
        "doctor": doctorName,
        "phoneDoctor": doctorPhone,
        "location": doctorLocation,
      }));
}

Future<List<Map<String, String>>> getServiceData(String username) async {
  List<Map<String, String>> service = [];
  String url =
      'https://project-88f34-default-rtdb.firebaseio.com/reservations.json';
  try {
    http.Response res = await http.get(Uri.parse(url));
    final Map<String, dynamic> extractedData =
        json.decode(res.body) as Map<String, dynamic>;
    extractedData.forEach((key, value) {
      if (value["phoneDoctor"] == username) {
        service += [
          {
            'name': value["name"],
            'phone': value["phone"],
            'date': value["date"],
            'time': value["time"],
            'doctor': value["doctor"],
            'phoneDoctor': value["phoneDoctor"],
            'location': value["location"],
          }
        ];
      }
    });
  } catch (error) {
    service;
  }
  return service;
}

Future<void> removeReservationsData(String name,String time)async {
  String url =
      'https://project-88f34-default-rtdb.firebaseio.com/reservations.json';
  try{
    http.Response res = await http.get(Uri.parse(url));
    final Map<String, dynamic> extractedData = json.decode(res.body) as Map<String, dynamic>;
    extractedData.forEach((key, value){
      if(value["name"] == name && value["time"] == time){
        print(name);
        FirebaseDatabase.instance.ref("Reservation").child(key).remove().then((value) => print("object"));
      }

    }
    );

  }catch(error){
    rethrow;
  }
}
