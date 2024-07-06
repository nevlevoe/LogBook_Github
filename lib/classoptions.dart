import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'menu.dart'; // Import the MenuPage
import 'attendanceList.dart'; // Import the AttendanceListPage
import 'attendanceviewList.dart'; // Import the AttendanceViewListPage
import 'ciemarksentering.dart'; // Import the CieEnterMarksPage
import 'ciemarksViewPage.dart'; // Import the CiemarksViewPage
import 'homepage.dart';

class ClassaWidget extends StatefulWidget {
  @override
  _ClassaWidgetState createState() => _ClassaWidgetState();
}

class _ClassaWidgetState extends State<ClassaWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ClassaWidget - FRAME
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        left: 10,
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                opaque: false,
                                pageBuilder: (BuildContext context, _, __) =>
                                    HomepageindexWidget(),
                              ),
                            );
                          },
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: MediaQuery.of(context).size.width / 2 - 80, // Center the text
                        child: Transform.rotate(
                          angle: 0.2591028889488524 * (math.pi / 180),
                          child: Text(
                            '4C - Subject Name',
                            textAlign: TextAlign.center,
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
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildMenuOption(
                          context,
                          'assets/images/vector.svg',
                          'Mark Attendance',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassaMarkattendanceWidget(),
                              ),
                            );
                          },
                        ),
                        _buildMenuOption(
                          context,
                          'assets/images/vector.svg',
                          'View Attendance',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassViewAttendanceWidget(), // Replace with your actual widget
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _buildMenuOption(
                          context,
                          'assets/images/vector.svg',
                          'Enter Marks',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CieandseeWidget(),
                              ),
                            );
                          },
                        ),
                        _buildMenuOption(
                          context,
                          'assets/images/vector.svg',
                          'View Marks',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassMarksViewingWidget(), // Navigate to ClassMarksViewingWidget
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, String assetPath, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 139,
        height: 139,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              offset: Offset(0, 4),
              blurRadius: 6,
            ),
          ],
          color: Color.fromRGBO(255, 245, 198, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              assetPath,
              semanticsLabel: 'vector',
            ),
            SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(165, 42, 42, 1),
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}