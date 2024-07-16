import 'dart:async';
import 'package:flutter/material.dart';
import 'login_student.dart';
import 'login_option.dart';
import 'login.dart';
import 'passwordreset.dart';
import 'overlaypasswordreset.dart';
import 'menu.dart'; // Import the HomepageindexWidget file
import 'homepage.dart'; // Import the Homepage file
import 'profile.dart'; // Import the ProfileWidget file
import 'homepage_student.dart';
import 'cie1.dart'; // Import the Cie1 widget
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPageWidget(),
      routes: {
        '/login': (context) => LoginWidget(),
        '/login_student': (context) => StudentLoginWidget(),
        '/login_option': (context) => TeacherStudentLoginWidget(),
        '/passwordreset': (context) => PasswordresetWidget(),
        '/overlaypasswordreset': (context) => Frame2610316Widget(),
        '/homepageindex': (context) => HomepageindexWidget(),
        '/homepage': (context) => HomepageWidget(teacherid: '_teacheridController.text'),
        '/menu': (context) => HomepageindexWidget(),
        '/profile': (context) => ProfileWidget(), // Add this route
        '/homepage_student': (context) => StudenthomepageWidget(), // Add this route



      },
    );
  }
}

class LandingPageWidget extends StatefulWidget {
  @override
  _LandingPageWidgetState createState() => _LandingPageWidgetState();
}

class _LandingPageWidgetState extends State<LandingPageWidget> {
  @override
  void initState() {
    super.initState();
    // Start a timer for 3 seconds
    Timer(const Duration(seconds: 3), () {
      // Navigate to Login Page after 3 seconds
      Navigator.of(context).pushReplacementNamed('/login_option');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.19, -0.98),
          end: Alignment(-0.19, 0.98),
          colors: [
            Color(0xFF3ABEF9),
            Color(0xFF3572EF),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 150,
              height: 153,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bmslogo.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 0),
            const Text(
              'LogBook',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                height: 1.2,
                letterSpacing: -0.85,
              ),
            ),
          ],
        ),
      ),
    );
  }
}