import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;

class ClassaMarkattendanceWidget extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  ClassaMarkattendanceWidget({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _ClassaMarkattendanceWidgetState createState() => _ClassaMarkattendanceWidgetState();
}

class _ClassaMarkattendanceWidgetState extends State<ClassaMarkattendanceWidget> {
  List<Map<String, String>> studentData = [];
  List<bool?> _isPresent = List<bool?>.filled(5, null);

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      QuerySnapshot subjectAttendanceSnapshot = await FirebaseFirestore.instance
          .collection('SubjectAttendance')
          .where('ClassID', isEqualTo: widget.classId)
          .where('TeacherID', isEqualTo: widget.teacherId)
          .where('SubjectID', isEqualTo: widget.subjectId)
          .get();

      List<Map<String, String>> fetchedData = [];

      for (var doc in subjectAttendanceSnapshot.docs) {
        String studentId = doc['StudentID'];
        DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
            .collection('Student')
            .where('StudentUSN', isEqualTo: studentId)
            .get()
            .then((snapshot) => snapshot.docs.first);

        fetchedData.add({
          'Fname': studentSnapshot['Fname'],
          'StudentID': studentId,
        });
      }

      setState(() {
        studentData = fetchedData;
        _isPresent = List<bool?>.filled(studentData.length, null);
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  Future<void> handleSubmit() async {
    try {
      for (int i = 0; i < studentData.length; i++) {
        String studentId = studentData[i]['StudentID']!;
        QuerySnapshot subjectAttendanceSnapshot = await FirebaseFirestore.instance
            .collection('SubjectAttendance')
            .where('ClassID', isEqualTo: widget.classId)
            .where('TeacherID', isEqualTo: widget.teacherId)
            .where('SubjectID', isEqualTo: widget.subjectId)
            .where('StudentID', isEqualTo: studentId)
            .get();

        if (subjectAttendanceSnapshot.docs.isNotEmpty) {
          DocumentSnapshot documentSnapshot = subjectAttendanceSnapshot.docs.first;
          int noOfClassesTaken = documentSnapshot['NoOfClassesTaken'];
          int noOfClassesPresent = documentSnapshot['NoOfClassesPresent'];

          noOfClassesTaken++;
          if (_isPresent[i] == true || _isPresent[i] == null) {
            noOfClassesPresent++;
          }

          double attendancePercentage = (noOfClassesPresent / noOfClassesTaken) * 100;
          String eligibility = attendancePercentage >= 85 ? 'Eligible' : 'Not Eligible';

          await FirebaseFirestore.instance
              .collection('SubjectAttendance')
              .doc(documentSnapshot.id)
              .update({
            'NoOfClassesTaken': noOfClassesTaken,
            'NoOfClassesPresent': noOfClassesPresent,
            'AttendancePercentage': attendancePercentage,
            'Eligibility': eligibility,
          });
        }
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Attendance submitted successfully!')),
      );
      Navigator.pop(context);
    } catch (e) {
      print('Error submitting attendance: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error submitting attendance!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3572EF),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'Mark Attendance',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFFFFF),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Expanded(
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: studentData.length,
                          itemBuilder: (context, index) {
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
                                    colors: _isPresent[index] == null
                                        ? [Colors.green.withOpacity(0.5), Colors.blue.withOpacity(0.5)]
                                        : _isPresent[index]!
                                        ? [Color(0xFF6FCF97), Color(0xFF3ABEF9)]
                                        : [Color(0xFFFF6F61), Color(0xFF3ABEF9)],
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            studentData[index]['Fname']!,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: 'Poppins',
                                              fontSize: 32,
                                              letterSpacing: 0,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          Text(
                                            studentData[index]['StudentID']!,
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
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Text('P', style: TextStyle(color: Colors.white)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPresent[index] = true;
                                            });
                                          },
                                        ),
                                        IconButton(
                                          icon: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Text('A', style: TextStyle(color: Colors.white)),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _isPresent[index] = false;
                                            });
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              handleSubmit(); // Call the handleSubmit function when pressed
            },
            child: Container(
              color: Color.fromRGBO(53, 114, 239, 1),
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
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

class AttendanceHomepageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
