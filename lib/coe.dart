import 'package:flutter/material.dart';
import 'dart:math' as math;

class CoeWidget extends StatefulWidget {
  final String teacherId;

  CoeWidget({
    required this.teacherId,
  });
  @override
  _CoeWidgetState createState() => _CoeWidgetState();
}

class _CoeWidgetState extends State<CoeWidget> {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator CoeWidget - FRAME

    return Container(
        width: 360,
        height: 800,
        decoration: BoxDecoration(
          boxShadow : [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0,4),
              blurRadius: 4
          )],
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
                                left: 43,
                                child: Text('BMSCELogbook', textAlign: TextAlign.center, style: TextStyle(
                                    color: Colors.white,
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
                  top: 94,
                  left: 12,
                  child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        boxShadow : [BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0,4),
                            blurRadius: 4
                        )],
                        image : DecorationImage(
                            image: AssetImage('assets/Calendar_month_24dp_fill0_wght400_grad0_opsz2411.png'),
                            fit: BoxFit.fitWidth
                        ),
                      )
                  )
              ),Positioned(
                  top: 91,
                  left: 43,
                  child: Text('Calendar of events', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'DM Sans',
                      fontSize: 24,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.5 /*PERCENT not supported*/
                  ),)
              ),Positioned(
                  top: 166,
                  left: 342,
                  child: Transform.rotate(
                    angle: -90 * (math.pi / 180),
                    child: Container(
                        width: 469,
                        height: 324,
                        decoration: BoxDecoration(
                          image : DecorationImage(
                              image: AssetImage('assets/Screenshot20240614at12101.png'),
                              fit: BoxFit.fitWidth
                          ),
                        )
                    ),
                  )
              ),
            ]
        )
    );
  }
}
