import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class ClassViewAttendanceWidget extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  ClassViewAttendanceWidget({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _ClassViewAttendanceWidgetState createState() => _ClassViewAttendanceWidgetState();
}

class _ClassViewAttendanceWidgetState extends State<ClassViewAttendanceWidget> {
  List<Map<String, dynamic>> studentData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudentData();
  }

  Future<void> fetchStudentData() async {
    try {
      print('Fetching attendance data...');

      final QuerySnapshot attendanceSnapshot = await FirebaseFirestore.instance
          .collection('SubjectAttendance')
          .where('ClassID', isEqualTo: widget.classId)
          .where('SubjectID', isEqualTo: widget.subjectId)
          .where('TeacherID', isEqualTo: widget.teacherId)
          .get();

      print('Attendance data fetched: ${attendanceSnapshot.docs.length} records found.');

      List<Map<String, dynamic>> fetchedData = [];

      for (var doc in attendanceSnapshot.docs) {
        Map<String, dynamic> attendanceData = doc.data() as Map<String, dynamic>;
        print('Processing attendance record for StudentID: ${attendanceData['StudentID']}');
        String studentId = doc['StudentID'];

        DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
            .collection('Student')
            .where('StudentUSN', isEqualTo: studentId)
            .get()
            .then((snapshot) => snapshot.docs.first);

        if (studentSnapshot.exists) {
          Map<String, dynamic> studentData = studentSnapshot.data() as Map<String, dynamic>;
          print('Student found: ${studentData['Fname']}');

          fetchedData.add({
            'StudentName': studentData['Fname'],
            'StudentID': attendanceData['StudentID'],
            'Eligibility': attendanceData['Eligibility'],
            'AttendancePercentage': attendanceData['AttendancePercentage'],
          });
        } else {
          print('StudentID: ${attendanceData['StudentID']} does not exist.');
        }
      }

      print('Fetched student data: $fetchedData');

      setState(() {
        studentData = fetchedData;
        isLoading = false;
      });
      print('State updated with student data.');

    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> exportToExcel() async {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];

    // Add column headers
    sheetObject.appendRow(['Student Name', 'Student ID', 'Eligibility', 'Attendance Percentage']);

    // Add student data
    for (var student in studentData) {
      sheetObject.appendRow([
        student['StudentName'],
        student['StudentID'],
        student['Eligibility'],
        student['AttendancePercentage']
      ]);
    }

    // Save the file
    Directory? directory = await getExternalStorageDirectory();
    String outputPath = "${directory?.path}/attendance.xlsx";
    File(outputPath)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.save()!);

    print('Attendance data exported to $outputPath');
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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: studentData.length,
              itemBuilder: (context, index) {
                String studentName = studentData[index]['StudentName'];
                String studentID = studentData[index]['StudentID'];
                String eligibility = studentData[index]['Eligibility'];
                double attendancePercentage = studentData[index]['AttendancePercentage'];

                Color startColor;
                if (eligibility == 'Eligible') {
                  startColor = Color(0xFF6FCF97);
                } else if (eligibility == 'Not Eligible' && attendancePercentage >= 75) {
                  startColor = Colors.amber;
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                studentName,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 24,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Text(
                                '$studentID | $eligibility',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
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
          ),
          Container(
            color: Color.fromRGBO(53, 114, 239, 1),
            padding: EdgeInsets.all(20), // Increase padding to make it larger
            child: GestureDetector(
              onTap: () async {
                await exportToExcel();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Attendance data exported successfully')),
                );
              },
              child: Center(
                child: Text(
                  'PRINT ATTENDANCE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14, // Slightly larger font size
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
