import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentviewmarksWidget extends StatefulWidget {
  final String studentusn;

  StudentviewmarksWidget({required this.studentusn});

  @override
  _StudentviewmarksWidgetState createState() => _StudentviewmarksWidgetState();
}

class _StudentviewmarksWidgetState extends State<StudentviewmarksWidget> {
  @override
  Widget build(BuildContext context) {
    print('Building StudentviewmarksWidget for student USN: ${widget.studentusn}');

    return Scaffold(
      appBar: AppBar(
        title: Text('MARKS', style: TextStyle(fontFamily: 'Poppins', fontSize: 20)),
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            print('Back button pressed');
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<QuerySnapshot>(
                future: FirebaseFirestore.instance
                    .collection('StudentMarks')
                    .where('StudentID', isEqualTo: widget.studentusn)
                    .get(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    print('Loading data...');
                    return Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    print('Error fetching data: ${snapshot.error}');
                    return Center(child: Text('Error fetching data'));
                  }

                  print('Data fetched successfully: ${snapshot.data?.docs.length} documents found');
                  var documents = snapshot.data!.docs;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: [
                        DataColumn(label: Text('Subject')),
                        DataColumn(label: Text('CIE1')),
                        DataColumn(label: Text('CIE2')),
                        DataColumn(label: Text('CIE3')),
                      ],
                      rows: documents
                          .map((doc) {
                        print('Document data: ${doc.data()}');
                        return DataRow(cells: [
                          DataCell(Text(doc['SubjectID'])),
                          DataCell(Text(doc['CIE1'].toString())),
                          DataCell(Text(doc['CIE2'].toString())),
                          DataCell(Text(doc['CIE3'].toString())),
                        ]);
                      })
                          .toList(),
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
