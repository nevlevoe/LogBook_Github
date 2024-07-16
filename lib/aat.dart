import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class Aat extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  Aat({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _AatState createState() => _AatState();
}

class _AatState extends State<Aat> {
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
      List<dynamic> aat = doc['AAT'];
      students.add({
        'studentID': studentID,
        'studentName': studentName,
        'documentID': doc.id,
        'aat': aat,
        'controller1': TextEditingController(text: aat[0].toString()),
        'controller2': TextEditingController(text: aat[1].toString())
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
          .update({
        'AAT': [
          student['controller1'].text,
          student['controller2'].text,
        ]
      });
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Changes Saved')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    print('Building Aat widget with ${_students.length} students');
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
            'AAT',
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
                            controller: student['controller1'],
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
                          SizedBox(height: 16),
                          TextField(
                            controller: student['controller2'],
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
