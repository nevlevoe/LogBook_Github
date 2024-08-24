import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math' as math;
import 'package:excel/excel.dart';
import 'package:open_filex/open_filex.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

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
  _ClassMarksViewingWidgetState createState() =>
      _ClassMarksViewingWidgetState();
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

  Future<void> exportToExcel(List<Map<String, dynamic>> fetchedData) async {
    if (await Permission.storage.request().isGranted) {
      Excel excel = Excel.createExcel();
      excel.rename(excel.getDefaultSheet()!, "Attendance");

      Sheet sheet = excel["Attendance"];

      var cell1 = sheet.cell(CellIndex.indexByString('A1'));
      cell1.value = TextCellValue('USN');
      var cell3 = sheet.cell(CellIndex.indexByString('B1'));
      cell3.value = TextCellValue('CIE1');
      var cell4 = sheet.cell(CellIndex.indexByString('C1'));
      cell4.value = TextCellValue('CIE2');
      var cell5 = sheet.cell(CellIndex.indexByString('D1'));
      cell5.value = TextCellValue('CIE3');
      var cell6 = sheet.cell(CellIndex.indexByString('E1'));
      cell6.value = TextCellValue('AAT');
      var cell7 = sheet.cell(CellIndex.indexByString('F1'));
      cell7.value = TextCellValue('Practicals');

      for (int i = 0; i < fetchedData.length; i++) {
        var student = fetchedData[i];
        sheet.cell(CellIndex.indexByString('A${i + 2}')).value = TextCellValue(student['StudentID']);
        sheet.cell(CellIndex.indexByString('B${i + 2}')).value = TextCellValue(student['CIE1'].toString());
        sheet.cell(CellIndex.indexByString('C${i + 2}')).value = TextCellValue(student['CIE2'].toString());
        sheet.cell(CellIndex.indexByString('D${i + 2}')).value = TextCellValue(student['CIE3'].toString());
        sheet.cell(CellIndex.indexByString('E${i + 2}')).value = TextCellValue(student['AAT'].toString());
        sheet.cell(CellIndex.indexByString('F${i + 2}')).value = TextCellValue(student['Practicals'].toString());

      }

      var fileBytes = excel.save();
      var directory = await getApplicationDocumentsDirectory();
      String directoryPath = '${directory.path}/output_file_name.xlsx';

      File(directoryPath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes!);
      OpenFilex.open(directoryPath);
    } else {
      print('Permission denied');
    }
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
                    onPressed: () async {
                      var fetchedMarks = await _studentMarks;
                      exportToExcel(fetchedMarks);
                    },
                    child: Text(
                      'PRINT MARKS',
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
