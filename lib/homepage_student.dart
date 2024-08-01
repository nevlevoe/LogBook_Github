import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;
import 'student_view_marks.dart';
import 'student_view_attendance.dart';

class StudentHomeWidget extends StatefulWidget {
  final String studentusn;

  StudentHomeWidget({
    required this.studentusn,
  });

  @override
  _StudentHomeWidgetState createState() => _StudentHomeWidgetState();
}

class _StudentHomeWidgetState extends State<StudentHomeWidget> {
  String studentName = 'Loading...';

  @override
  void initState() {
    super.initState();
    _fetchStudentName();
  }

  Future<void> _fetchStudentName() async {
    try {
      print("Fetching student name for USN: ${widget.studentusn}");

      QuerySnapshot studentDocs = await FirebaseFirestore.instance
          .collection('Student')
          .where('StudentUSN', isEqualTo: widget.studentusn)
          .get();

      print("Query completed with ${studentDocs.docs.length} documents found.");

      if (studentDocs.docs.isNotEmpty) {
        setState(() {
          studentName = studentDocs.docs[0]['Fname'];
        });
        print("Student name found: $studentName");
      } else {
        setState(() {
          studentName = 'Not Found';
        });
        print("No matching student found.");
      }
    } catch (e) {
      setState(() {
        studentName = 'Error';
      });
      print("Error fetching student name: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, top: 16.25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Transform.rotate(
                              angle: 0.2591028889488524 * (math.pi / 180),
                              child: Text(
                                'Hello',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                            ),
                            SizedBox(width: 10), // Space between 'Hello' and studentName
                            Text(
                              studentName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 153, 0, 1),
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                height: 1,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.logout, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 87,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentviewmarksWidget(studentusn: widget.studentusn,)),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 153, 0, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'VIEW CIE MARKS',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 87,
                left: 310,  // Adjusted from 290 to 310
                child: Container(
                  width: 79,
                  height: 59,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Pngtreeschoolmaterialsclipartcartoon_132473861.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 163,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StudentviewattendanceWidget(studentusn: widget.studentusn,)),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 20,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 114, 239, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'VIEW ATTENDANCE',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 163,
                left: 310,  // Adjusted from 290 to 310
                child: Container(
                  width: 79,
                  height: 59,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Pngtreenotebookandpencil3d_68616221.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
