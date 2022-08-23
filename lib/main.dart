import 'package:breast_cancer/screens/disease.dart';
import 'package:breast_cancer/screens/factors.dart';
import 'package:breast_cancer/screens/home_screen.dart';
import 'package:breast_cancer/screens/reservation.dart';
import 'package:breast_cancer/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/signin_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', ''),
        ],
        title: 'Breast Cancer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ChatScreen(),
        initialRoute:
        _auth.currentUser != null
            ? HomeScreen.screenRoute
            : SplashScreen.screenRoute,
        routes: {
          SplashScreen.screenRoute: (context) => SplashScreen(),
          WelcomeScreen.screenRoute: (context) => WelcomeScreen(),
          SignInScreen.screenRoute: (context) => SignInScreen(),
          RegistrationScreen.screenRoute: (context) => RegistrationScreen(),
          ChatScreen.screenRoute: (context) => ChatScreen(),
          HomeScreen.screenRoute: (context) => HomeScreen(),
          DiseaseScreen.screenRoute: (context) => DiseaseScreen(),
          FactorsScreen.screenRoute: (context) => FactorsScreen(),
          Reservation.screenRoute: (context) => Reservation(),
        });
  }
}
