import 'package:breast_cancer/screens/reservation.dart';
import 'package:flutter/material.dart';

import '../widgets/my_button.dart';

class SeeDoctor extends StatelessWidget {
  const SeeDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorButtonpink,
        title: const Text(
          "رؤية الطبيب",
          style: TextStyle(
              color: Color(0xFFF8F9FA),
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/seeDoctor.jpeg"),
              SizedBox(height: 10,),
              Text("متى أذهب للطبيب",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5,),
              Text("عند ظهور أي تغيرات في الثدي أو ظهور أحد الأعراض المذكورة سابقاً فيجب المسارعة للطبيب."
              ),
              SizedBox(height: 20,),
              MyButton(
                  color: colorButtonpink!,
                  title: 'اختر طبيبك',
                  onPressed:(){
                    navigatePush(context, Reservation());
                  }
              ),


            ],
          ),
        ),
      ),
    );
  }
}
