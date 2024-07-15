import 'package:flutter/material.dart';


class StudenthomepageWidget extends StatefulWidget {
  @override
  _StudenthomepageWidgetState createState() => _StudenthomepageWidgetState();
}

class _StudenthomepageWidgetState extends State<StudenthomepageWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator StudenthomepageWidget - FRAME

    return Container(
        width: 357,
        height: 804,
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
                      ),
                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 22,
                                left: 42,
                                child: Text('Home', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 20,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.2831683158874512
                                ),)
                            ),Positioned(
                                top: 23,
                                left: 12,
                                child: Container()
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 101,
                  left: 97,
                  child: Container(
                      width: 155,
                      height: 21,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Text('View Attendance ', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.7108910878499348
                                ),)
                            ),
                          ]
                      )
                  )
              ),Positioned(
                  top: 421,
                  left: 97,
                  child: Container(
                      width: 155,
                      height: 21,

                      child: Stack(
                          children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Text('View CIE ', textAlign: TextAlign.center, style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'DM Sans',
                                    fontSize: 15,
                                    letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.7108910878499348
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
