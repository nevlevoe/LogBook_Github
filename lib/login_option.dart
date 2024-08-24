import 'package:flutter/material.dart';
import 'login.dart';
import 'login_student.dart';

class TeacherStudentLoginWidget extends StatefulWidget {
  @override
  _TeacherStudentLoginWidgetState createState() =>
      _TeacherStudentLoginWidgetState();
}

class _TeacherStudentLoginWidgetState
    extends State<TeacherStudentLoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity, // Takes the full width of the screen
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 153,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bmslogo.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(height: 50), // Space between the logo and the first button
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  width: double.infinity, // Make button full width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(202, 214, 255, 1),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                    child: Text(
                      'TEACHER',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Space between the buttons
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login_student');
                },
                child: Container(
                  width: double.infinity, // Make button full width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(202, 214, 255, 1),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      ),
                    ],
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                    child: Text(
                      'STUDENT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
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
