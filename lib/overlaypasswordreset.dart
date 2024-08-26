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
      backgroundColor: Colors.transparent, // Keep the background transparent
      body: Center(
        child: Container(
          width: 300, // Width remains the same
          height: 400, // Adjusted height to be shorter
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white, // Box background is solid white
            boxShadow: [
              // Optional: subtle shadow for depth
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 70, // Adjusted top position
                left: 0,
                child: Container(
                  width: 300, // Width remains the same
                  height: 250, // Adjusted height to fit within the new container height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(247, 247, 247, 1),
                  ),
                ),
              ),
              Positioned(
                top: 250, // Adjusted top position
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
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjusted padding
                        child: Text(
                          'Edit Mail ID',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16), // Adjusted space between buttons
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color.fromRGBO(53, 114, 239, 1),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Adjusted padding
                        child: Text(
                          'Go to Login',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
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
                top: 130, // Adjusted top position
                left: 60, // Adjusted left position
                child: Text(
                  'Successful!!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 20, // Adjusted font size
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Positioned(
                top: 130, // Adjusted top position
                left: 20, // Adjusted left position
                child: Container(
                  width: 28, // Adjusted width
                  height: 28, // Adjusted height
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bluetickpasswordoverlay.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 170, // Adjusted top position
                left: 20, // Adjusted left position
                right: 20,
                child: Text(
                  'Your username and password have been sent to your college mail ID.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 16, // Adjusted font size
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
