import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    home: LandingPageWidget(),
  ));
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
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginWidget(),
      ));
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
                image:  DecorationImage(
                  image:  AssetImage('assets/bmslogo.png'),
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
