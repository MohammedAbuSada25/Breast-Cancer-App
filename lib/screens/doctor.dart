import 'package:breast_cancer/widgets/modelReservation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/my_button.dart';

class DoctorScreen extends StatelessWidget {

  DoctorScreen(this.doctor);
  Model doctor;

  final _firestore = FirebaseFirestore.instance;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "احجز طبيبك",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(doctor.image,height: 200,),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          doctor.phone,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Text(
                          doctor.location,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height: 50,),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorButtonpink!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.center,

                decoration: InputDecoration(
                  hintText: 'Enter your Phone',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorButtonpink!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: dateController,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                onTap: (){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate:DateTime(2090),
                  ).then((value) {
                    dateController.text =
                        DateFormat.yMMMd().format(value!);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Date',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorButtonpink!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextField(
                controller: timeController,
                keyboardType: TextInputType.datetime,
                textAlign: TextAlign.center,
                onTap: (){
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),

                  ).then((value) {
                    timeController.text = value!.format(context).toString();
                  }) ;
                },
                decoration: InputDecoration(
                  hintText: 'Enter your Date',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: colorButtonpink!,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              MyButton(
                  color: colorButtonpink!,
                  title: 'احجز',
                  onPressed:(){
                    if(nameController.text.isEmpty || timeController.text.isEmpty ||
                        dateController.text.isEmpty || phoneController.text.isEmpty )
                    {
                      snackBar(context, "الرجاء ادخل جميع الحقول", Colors.red);
                    }
                    else {
                      _firestore.collection("reservations").add({
                        "name": nameController.text,
                        "phone": phoneController.text,
                        "date": dateController.text,
                        "time": timeController.text,
                        "doctor": doctor.name,
                        "phoneDoctor": doctor.phone,
                        "location": doctor.location,
                      }).then((value) {
                        snackBar(context, "تم الحجز", Colors.green);
                        nameController.clear();
                        phoneController.clear();
                        dateController.clear();
                        timeController.clear();
                      });
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }


}
