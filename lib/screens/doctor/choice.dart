import 'package:breast_cancer/screens/doctor/homeDoctor.dart';
import 'package:breast_cancer/screens/home_screen.dart';
import 'package:breast_cancer/screens/shared_pref/shared_pref_componants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/my_button.dart';

class ChoiceScreen extends StatefulWidget {
  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Column(
            //   children: [
            //     Container(
            //       height: 180,
            //       child: Image.asset('images/logo.png'),
            //     ),
            //     Text(
            //       'Breast Cancer',
            //       style: TextStyle(
            //         fontSize: 40,
            //         fontWeight: FontWeight.w900,
            //         color: colorLogo,
            //       ),
            //     ),
            //   ],
            // ),
            SizedBox(height: 30),
            MyButton(
              color: colorButtonpink!,
              title: 'الدخول الى التطبيق',
              onPressed: () async {
                String email =
                    SharedPrefController().getStringData(key: "email");
                String password =
                    SharedPrefController().getStringData(key: "password");
                // print(email);
                // print(password);
                await _auth
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) => print(email));

                navigatePush(context, HomeScreen());
              },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: 'الدخول الى حجوزات العملاء',
              onPressed: () {
                navigatePush(context, HomeDoctor());
              },
            )
          ],
        ),
      ),
    );
  }

}
