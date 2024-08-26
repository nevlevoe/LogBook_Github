import 'package:cloud_firestore/cloud_firestore.dart';

class Service {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  /////////////////////////////////////////////Add new student////////////////////////////////
  //Student collection
  Future<void> addStudent() async {
    try {
      await _firestore.collection('Student').add({
        'CollegeEmail': 'gurrala.cs22@bmsce.ac.in',
        'Fname': 'Gurrala',
        'Lname': 'Pragnathmick',
        'Mname': 'Naga',
        'Password': 'BMSCE',
        'PersonalEmail': 'gpngpngpn@gmail.com',
        'ProctorID': '001',
        'Section': 'B',
        'Semester': 4,
        'StudentUSN': '1BM22CS103',
        'YearOfPass': 2026,
      });
      print('Student added successfully');
    } catch (e) {
      print('Error adding student: $e');
    }
  }

  //StudentMarks collection
  Future<void> addStudentMarks() async {
    try {
      await _firestore.collection('StudentMarks').add({
        'AAT': ['6', '7'], // Array of AAT scores
        'CIE1': '4',
        'CIE2': '15',
        'CIE3': '14',
        'ClassID': 'CS4C00323CS3PCTFC',
        'MarksID': 'MARKS12314',
        'StudentID': '1BM22CS153',
        'SubjectID': '23CS3PCTFC',
        'TeacherID': '003',
      });
      print('Student Marks added successfully');
    } catch (e) {
      print('Error adding student marks: $e');
    }
  }

  //SubjectAttendance collection
  Future<void> addSubjectAttendance() async {
    try {
      await _firestore.collection('SubjectAttendance').add({
        'AttendanceID': 'ATT11',
        'AttendancePercentage': 0,
        'ClassID': 'CS4C00323CS3PCTFC',
        'Eligibility': 'Not Eligible',
        'NoOfClassesPresent': 0,
        'NoOfClassesTaken': 0,
        'StudentID': '1BM22CS153',
        'SubjectID': '23CS3PCTFC',
        'TeacherID': '003',
      });
      print('Subject Attendance added successfully');
    } catch (e) {
      print('Error adding subject attendance: $e');
    }
  }
  ////////////////////////////New class ///////////////////////////////////////////////////////////
  //SubjectDetails
  Future<void> addSubjectDetails() async {
    try {
      await _firestore.collection('SubjectDetails').add({
        'CourseType': 'Theory',
        'Credits': 3,
        'MaxAat': 20,
        'MaxCieMarks': 40,
        'NoOfCies': 3,
        'Practicals': 0,
        'Project': 0,
        'ReducedAat': 5,
        'ReducedCieMarks': 20,
        'SubjectID': '23CS3PCTFC',
        'SubjectName': 'Theory found comp',
      });
      print('Subject details added successfully');
    } catch (e) {
      print('Error adding subject details: $e');
    }
  }
  //Classes
  Future<void> addClass() async {
    try {
      await _firestore.collection('Classes').add({
        'ClassID': 'CS4C00323CS3PCTFC',
        'Day': ['Monday', 'Saturday'],
        'Section': 'C',
        'Semester': '4',
        'SubjectID': '23CS3PCTFC',
        'TeacherID': '003',
        'Time': ['2:00', '9:00'],
      });
      print('Class added successfully');
    } catch (e) {
      print('Error adding class: $e');
    }
  }
  //////////////////////////////////////adding new teacher///////////////////////////////
  //Teacher
  Future<void> addTeacher() async {
    try {
      await _firestore.collection('Teacher').add({
        'CollegeEmail': 'jakkali.cse@bmsce.ac.in',
        'DepartmentID': 'cse',
        'Password': 'BMSCE',
        'Phone1': 234567891,
        'Phone2': '8765432109',
        'TeacherFname': 'Basavaraj',
        'TeacherID': '003',
        'TeacherLname': 'Jakkali',
      });
      print('Teacher added successfully');
    } catch (e) {
      print('Error adding teacher: $e');
    }
  }

}
