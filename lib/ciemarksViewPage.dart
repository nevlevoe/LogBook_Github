import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'menu.dart';  // Ensure you have this file created in your project

class ClassMarksViewingWidget extends StatefulWidget {
  @override
  _ClassaattendanceWidgetState createState() => _ClassaattendanceWidgetState();
}

class _ClassaattendanceWidgetState extends State<ClassMarksViewingWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ClassaattendanceWidget - FRAME

    return Scaffold(
      body: Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 360,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(53, 114, 239, 1),
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 11,
              child: IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomepageindexWidget()),  // Ensure you have a MenuPage widget in menu.dart
                  );
                },
              ),
            ),
            Positioned(
              top: 18.98056411743164,
              left: 59,
              child: Transform.rotate(
                angle: 0.2591028889488524 * (math.pi / 180),
                child: Text(
                  'VIEW ATTENDANCE',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
