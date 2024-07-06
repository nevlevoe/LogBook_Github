import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Frame2610316Widget extends StatefulWidget {
  @override
  _Frame2610316WidgetState createState() => _Frame2610316WidgetState();
}

class _Frame2610316WidgetState extends State<Frame2610316Widget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 300,
          height: 497,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 97,
                left: 0,
                child: Container(
                  width: 300,
                  height: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(247, 247, 247, 1),
                  ),
                ),
              ),
              Positioned(
                top: 400,
                left: 125,
                child: SvgPicture.asset(
                  'assets/images/rectangle.svg',
                  semanticsLabel: 'rectangle',
                ),
              ),
              Align(
                alignment: Alignment(0, 0.8), // Adjust this to position vertically
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/passwordreset');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(53, 114, 239, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          'Edit Mail ID',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20), // Space between the buttons
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(53, 114, 239, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        child: Text(
                          'Go to Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 155,
                left: 91,
                child: Text(
                  'Successful!!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 155,
                left: 55,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bluetickpasswordoverlay.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 30,
                right: 30,
                child: Text(
                  'Your username and password have been sent to your college mail ID.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    height: 1.5,
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