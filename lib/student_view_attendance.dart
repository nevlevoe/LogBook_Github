import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class StudentviewattendanceWidget extends StatefulWidget {
  @override
  _StudentviewattendanceWidgetState createState() => _StudentviewattendanceWidgetState();
}

class _StudentviewattendanceWidgetState extends State<StudentviewattendanceWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StudentviewattendanceWidget - FRAME

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
                  top: 19.86825942993164,
                  left: 50,
                  child: Transform.rotate(
                    angle: 0.2591028889488524 * (math.pi / 180),
                    child: Text('ATTENDANCE', textAlign: TextAlign.left, style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                        fontWeight: FontWeight.normal,
                        height: 1
                    ),),
                  )
              ),Positioned(
                  top: 176,
                  left: 393,
                  child: Container()
              ),Positioned(
                  top: 747,
                  left: 60,
                  child: Text('SUBMIT ', textAlign: TextAlign.center, style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
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
                            image: AssetImage('assets/images/Arrow_back_36dp_e8eaed_fill0_wght400_grad0_opsz401.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),Positioned(
                  top: 88,
                  left: 10,
                  child: Container(
                      width: 339,
                      height: 63,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 339,
                                    height: 63,

                                    child: Stack(
                                        children: <Widget>[
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              child: SvgPicture.asset(
                                                  'assets/images/rectangle17.svg',
                                                  semanticsLabel: 'rectangle17'
                                              ),
                                          ),
                                        ]
                                    )
                                )
                            ),Positioned(
                                top: 10,
                                left: 16,
                                child: Text('Monish P', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 0.8
                                ),)
                            ),Positioned(
                                top: 35,
                                left: 16,
                                child: Text('1BM22CS163', textAlign: TextAlign.left, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'Inter',
                                    fontSize: 11,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1.4545454545454546
                                ),)
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
