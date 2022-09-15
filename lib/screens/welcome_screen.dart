import 'package:flutter/material.dart';
import 'doctor/loginDoctor.dart';
import 'registration_screen.dart';
import 'signin_screen.dart';
import '../widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('images/logo.png'),
                ),
                Text(
                  'Breast Cancer',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: colorLogo,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
              color: colorButtonpink!,
              title: 'Login as a Doctor',
              onPressed: () {
                Navigator.pushNamed(context, LoginDoctor.screenRoute);
              },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: 'Login as a User',
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.screenRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
