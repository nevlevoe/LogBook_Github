import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;

class StudentviewattendanceWidget extends StatefulWidget {
  final String studentusn;

  StudentviewattendanceWidget({required this.studentusn});

  @override
  _StudentviewattendanceWidgetState createState() =>
      _StudentviewattendanceWidgetState();
}

class _StudentviewattendanceWidgetState extends State<StudentviewattendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'ATTENDANCE',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('SubjectAttendance')
                    .where('StudentID', isEqualTo: widget.studentusn)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  var documents = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('Subject')),
                          DataColumn(label: Text('Attendance Percentage')),
                          DataColumn(label: Text('Eligibility')),
                        ],
                        rows: documents.map((doc) {
                          return DataRow(cells: [
                            DataCell(Text(doc['SubjectID'])),
                            DataCell(Text(doc['AttendancePercentage'].toString())),
                            DataCell(Text(doc['Eligibility'])),
                          ]);
                        }).toList(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
