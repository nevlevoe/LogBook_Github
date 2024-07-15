import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'menu.dart'; // Import the MenuPage
import 'attendanceList.dart'; // Import the AttendanceListPage
import 'attendanceviewList.dart'; // Import the AttendanceViewListPage
import 'ciemarksentering.dart'; // Import the CieEnterMarksPage
import 'ciemarksViewPage.dart'; // Import the CiemarksViewPage

class ClassaWidget extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;
  final String semester;
  final String section;
  final String subject;

  ClassaWidget({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
    required this.semester,
    required this.section,
    required this.subject,
  });

  @override
  _ClassaWidgetState createState() => _ClassaWidgetState();
}

class _ClassaWidgetState extends State<ClassaWidget> {
  @override
  void initState() {
    super.initState();
    print('ClassId: ${widget.classId}');
    print('TeacherId: ${widget.teacherId}');
    print('SubjectId: ${widget.subjectId}');
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Center(
                        child: Text(
                          '${widget.semester}${widget.section} - ${widget.subject}',
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
                      SizedBox(width: 48), // Adjust to make title centered
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
                          'assets/how_to_reg.png',
                          'Mark Attendance',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassaMarkattendanceWidget(
                                  classId: widget.classId,
                                  teacherId: widget.teacherId,
                                  subjectId: widget.subjectId,
                                ),
                              ),
                            );
                          },
                        ),
                        _buildMenuOption(
                          context,
                          'assets/preview.png',
                          'View Attendance',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassViewAttendanceWidget(
                                  classId: widget.classId,
                                  teacherId: widget.teacherId,
                                  subjectId: widget.subjectId,
                                ),
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
                          'assets/edit_square.png',
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
                          'assets/preview.png',
                          'View Marks',
                              () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ClassMarksViewingWidget(),
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
    );
  }

  Widget _buildMenuOption(BuildContext context, String assetPath, String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 120,
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
            SizedBox(
              height: 60, // Adjust height for image
              child: Image.asset(
                assetPath,
                fit: BoxFit.contain, // Contain to keep aspect ratio
              ),
            ),
            SizedBox(height: 5), // Space between image and text
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(165, 42, 42, 1),
                fontFamily: 'Poppins',
                fontSize: 14, // Slightly smaller font size
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

