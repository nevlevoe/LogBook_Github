import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;

class ClassMarksViewingWidget extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  ClassMarksViewingWidget({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _ClassMarksViewingWidgetState createState() => _ClassMarksViewingWidgetState();
}

class _ClassMarksViewingWidgetState extends State<ClassMarksViewingWidget> {
  late Future<List<Map<String, dynamic>>> _studentMarks;

  @override
  void initState() {
    super.initState();
    _studentMarks = _fetchStudentMarks();
  }

  Future<List<Map<String, dynamic>>> _fetchStudentMarks() async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('StudentMarks')
        .where('ClassID', isEqualTo: widget.classId)
        .where('TeacherID', isEqualTo: widget.teacherId)
        .where('SubjectID', isEqualTo: widget.subjectId)
        .get();

    return querySnapshot.docs.map((doc) => doc.data()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MARKS', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _studentMarks,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data found'));
          }

          final studentMarks = snapshot.data!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('Student ID')),
                      DataColumn(label: Text('CIE 1')),
                      DataColumn(label: Text('CIE 2')),
                      DataColumn(label: Text('CIE 3')),
                      DataColumn(label: Text('AAT')),
                      DataColumn(label: Text('Practicals')),
                    ],
                    rows: studentMarks.map((mark) {
                      return DataRow(cells: [
                        DataCell(Text(mark['StudentID'] ?? '')),
                        DataCell(Text(mark['CIE1']?.toString() ?? '')),
                        DataCell(Text(mark['CIE2']?.toString() ?? '')),
                        DataCell(Text(mark['CIE3']?.toString() ?? '')),
                        DataCell(Text(mark['AAT']?.toString() ?? '')),
                        DataCell(Text(mark['Practicals']?.toString() ?? '')),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 70,
                color: Color.fromRGBO(53, 114, 239, 1),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // Handle submit action
                    },
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
          );
        },
      ),
    );
  }
}
