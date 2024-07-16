import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ViewmarksWidget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          color : Color.fromRGBO(255, 255, 255, 1),
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
                        color : Color.fromRGBO(53, 114, 239, 1),
                      )
                  )
              ),Positioned(
                  top: 730,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 70,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(53, 114, 239, 1),
                      )
                  )
              ),Positioned(
                  top: 19.86825942993164,
                  left: -8,
                  child: Transform.rotate(
                    angle: 0.2591028889488524 * (math.pi / 180),
                    child: Text('MARKS', textAlign: TextAlign.center, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        letterSpacing: 0 ,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 176,
                  left: 393,
                  child: Container(),
              ),Positioned(
                  top: 747,
                  left: 60,
                  child: Text('SUBMIT ', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      letterSpacing: 0 ,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),Positioned(
                  top: 25,
                  left: 15,
                  child: Container(
                      width: 30,
                      height: 20,
                      decoration: BoxDecoration(
                        image : DecorationImage(
                            image: AssetImage('assets/arrow_back.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),Positioned(
                  top: 91,
                  left: 15,
                  child: Container(
                      width: 676,
                      height: 64,
                      decoration: BoxDecoration(

                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 20,
                                left: 0,
                                child: Container(
                                    width: 171.9060821533203,
                                    height: 44,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 2,
                                              left: 0,
                                              child: SvgPicture.asset(
                                                  'assets/rectangle17.svg',
                                                  semanticsLabel: 'rectangle17'
                                              ),
                                          ),Positioned(
                                              top: 0,
                                              left: 7,
                                              child: Text('MONISH ', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(255, 255, 255, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 20,
                                                  letterSpacing: 0 ,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),Positioned(
                                              top: 24,
                                              left: 8,
                                              child: Text('1BM22CS163', textAlign: TextAlign.left, style: TextStyle(
                                                  color: Color.fromRGBO(5, 12, 156, 1),
                                                  fontFamily: 'Poppins',
                                                  fontSize: 12,
                                                  letterSpacing: 0 ,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1
                                              ),)
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 3,
                                left: 4,
                                child: Text('Student name', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 21,
                                left: 134,
                                child: Container(
                                    width: 542,
                                    height: 43,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                      color : Color.fromRGBO(255, 245, 198, 1),
                                    )
                                )
                            ),Positioned(
                                top: 0,
                                left: 119,
                                child: Container(
                                    width: 226,
                                    height: 21,
                                    decoration: BoxDecoration(

                                    ),
                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: Container(
                                                  width: 542,
                                                  height: 21,
                                                  decoration: BoxDecoration(
                                                    color : Color.fromRGBO(255, 255, 255, 1),
                                                  )
                                              )
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 4,
                                left: 127,
                                child: Text('CIE 1', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 4,
                                left: 207,
                                child: Text('CIE 2', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    letterSpacing: 0 ,
                                    fontWeight: FontWeight.normal,
                                    height: 1
                                ),)
                            ),Positioned(
                                top: 29,
                                left: 148,
                                child: Container(
                                    width: 34,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                      color : Color.fromRGBO(255, 255, 255, 0.9200000166893005),
                                    )
                                )
                            ),Positioned(
                                top: 29,
                                left: 299,
                                child: Container(
                                    width: 34,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                      color : Color.fromRGBO(255, 255, 255, 0.9200000166893005),
                                    )
                                )
                            ),Positioned(
                                top: 29,
                                left: 226,
                                child: Container(
                                    width: 34,
                                    height: 27,
                                    decoration: BoxDecoration(
                                      borderRadius : BorderRadius.only(
                                        topLeft: Radius.circular(6),
                                        topRight: Radius.circular(6),
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6),
                                      ),
                                      color : Color.fromRGBO(255, 255, 255, 0.9200000166893005),
                                    )
                                )
                            ),
                          ]
                      )
                  )
              ),
            ]
        )
    );
  }
}