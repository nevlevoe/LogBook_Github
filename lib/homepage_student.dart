import 'package:flutter/material.dart';
import 'dart:math' as math;

class StudentHomeWidget extends StatefulWidget {
  final String studentusn;

  StudentHomeWidget({
    required this.studentusn,
  });
  @override
  _StudentHomeWidgetState createState() => _StudentHomeWidgetState();
}

class _StudentHomeWidgetState extends State<StudentHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: 360,
          height: 800,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 360,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 19, top: 16.25),
                        child: Transform.rotate(
                          angle: 0.2591028889488524 * (math.pi / 180),
                          child: Text(
                            'Hello',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20, top: 16.25),
                        child: GestureDetector(
                          onTap: () {
                            // Add logout functionality here
                          },
                          child: Icon(Icons.logout, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 16,
                left: 75,
                child: Text(
                  'MONISH',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(255, 153, 0, 1),
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
              Positioned(
                top: 87,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    // Add navigation to view CIE marks page
                  },
                  child: Container(
                    width: 339,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 153, 0, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'VIEW CIE MARKS',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 87,
                left: 260,
                child: Container(
                  width: 79,
                  height: 59,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/Pngtreeschoolmaterialsclipartcartoon_132473861.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 163,
                left: 10,
                child: GestureDetector(
                  onTap: () {
                    // Add navigation to view attendance page
                  },
                  child: Container(
                    width: 339,
                    height: 63,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 114, 239, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'VIEW ATTENDANCE',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 163,
                left: 260,
                child: Container(
                  width: 79,
                  height: 59,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/Pngtreenotebookandpencil3d_68616221.png'),
                      fit: BoxFit.fitWidth,
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
