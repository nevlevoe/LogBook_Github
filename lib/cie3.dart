import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class Cie3 extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  Cie3({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _Cie3State createState() => _Cie3State();
}

class _Cie3State extends State<Cie3> {
  List<Map<String, dynamic>> _students = [];

  @override
  void initState() {
    super.initState();
    _fetchStudents();
  }

  Future<void> _fetchStudents() async {
    print('Fetching students for class ${widget.classId}, teacher ${widget.teacherId}, subject ${widget.subjectId}');
    QuerySnapshot studentMarksSnapshot = await FirebaseFirestore.instance
        .collection('StudentMarks')
        .where('ClassID', isEqualTo: widget.classId)
        .where('TeacherID', isEqualTo: widget.teacherId)
        .where('SubjectID', isEqualTo: widget.subjectId)
        .get();

    List<Map<String, dynamic>> students = [];

    for (var doc in studentMarksSnapshot.docs) {
      String studentID = doc['StudentID'];
      DocumentSnapshot studentSnapshot = await FirebaseFirestore.instance
          .collection('Student')
          .where('StudentUSN', isEqualTo: studentID)
          .limit(1)
          .get()
          .then((snapshot) => snapshot.docs.first);
      String studentName = studentSnapshot['Fname'];
      students.add({
        'studentID': studentID,
        'studentName': studentName,
        'documentID': doc.id,
        'cie3': doc['CIE3'],
        'controller': TextEditingController(text: doc['CIE3'].toString())
      });
    }

    setState(() {
      _students = students;
    });
  }

  Future<void> _submitMarks() async {
    print('Submitting marks for ${_students.length} students');
    for (var student in _students) {
      await FirebaseFirestore.instance
          .collection('StudentMarks')
          .doc(student['documentID'])
          .update({'CIE3': student['controller'].text});
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes Saved')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    print('Building Cie3 widget with ${_students.length} students');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Transform.rotate(
          angle: 0.259 * (math.pi / 180),
          child: Text(
            'CIE 3',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 55,
              left: 20,
              child: Text(
                'Enter the marks below:',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color.fromRGBO(5, 12, 156, 1),
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 20,
              right: 20,
              child: SingleChildScrollView(
                child: Column(
                  children: _students.map((student) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            student['studentName'],
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            student['studentID'],
                            style: TextStyle(
                              color: Color.fromRGBO(5, 12, 156, 1),
                              fontFamily: 'Poppins',
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: student['controller'],
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                            ],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4),
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(227, 232, 238, 1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: _submitMarks,
                child: Container(
                  height: 70,
                  color: Color.fromRGBO(53, 114, 239, 1),
                  child: Center(
                    child: Text(
                      'SUBMIT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
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
