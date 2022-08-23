import 'package:breast_cancer/screens/doctor.dart';
import 'package:breast_cancer/widgets/modelReservation.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class Reservation extends StatelessWidget {
  static const String screenRoute = 'Reservation_screen';
  List<Model> list = [
    Model(
        image: "images/doctor/doctor1.jpg",
        name: "د.فلان الفلاني1",
        location: "رفح - الجنينة"),
    Model(
        image: "images/doctor/doctor2.jpg",
        name: "د.فلان الفلاني2",
        location: "رفح - الجنينة"),
    Model(
        image: "images/doctor/doctor3.jpg",
        name: "د.فلان الفلاني3",
        location: "رفح - الجنينة"),
    Model(
        image: "images/doctor/doctor1.jpg",
        name: "د.فلان الفلاني4",
        location: "رفح - الجنينة"),
    Model(
        image: "images/doctor/doctor2.jpg",
        name: "د.فلان الفلاني5",
        location: "رفح - الجنينة"),
    Model(
        image: "images/doctor/doctor3.jpg",
        name: "د.فلان الفلاني6",
        location: "رفح - الجنينة"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "اختار طبيبك",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return item(
              image: list[index].image,
              name: list[index].name,
              location: list[index].location,
              index: index,
              context: context);
        },
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  Widget item(
      {required String image,
      required String name,
      required String location,
      required int index,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            children: [
              Image.asset(
                image,
                height: 120,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  print(index);
                  navigatePush(context, DoctorScreen(list[index]));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  textDirection: TextDirection.ltr,
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}