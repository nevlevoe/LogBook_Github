import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

import 'menu.dart'; // Import the MenuPage

class ClassViewAttendanceWidget extends StatefulWidget {
  @override
  _ClassViewAttendanceWidgetState createState() =>
      _ClassViewAttendanceWidgetState();
}

class _ClassViewAttendanceWidgetState extends State<ClassViewAttendanceWidget> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'VIEW ATTENDANCE',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: 20,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white), // Ensure menu button color is white
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomepageindexWidget()), // Navigate to MenuPage
            );
          },
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
          ),
          ListView.builder(
            padding: EdgeInsets.all(8.0),
            itemCount: 3, // Number of placards
            itemBuilder: (context, index) {
              // Dummy data for demonstration
              String studentName = 'Student ${index + 1}';
              double attendancePercentage = (index == 0)
                  ? 90.0
                  : (index == 1)
                  ? 80.0
                  : 70.0;

              Color startColor;
              if (attendancePercentage > 85) {
                startColor = Color(0xFF6FCF97);
              } else if (attendancePercentage > 75) {
                startColor = Colors.yellow;
              } else {
                startColor = Color(0xFFFF6F61);
              }

              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  width: double.infinity,
                  height: 95,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [startColor, Color(0xFF3ABEF9)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          studentName,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          '${attendancePercentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          if (isMenuOpen)
            BlurredBackground(
              child: HomepageindexWidget(), // Replace with your actual MenuPage widget
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class BlurredBackground extends StatelessWidget {
  final Widget child;

  const BlurredBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // Background blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
            ),
          ),
          // Menu content
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8, // Adjust the width as needed
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}