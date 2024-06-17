import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 800,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 383,
            left: 12,
            child: Container(),
          ),
          Positioned(
            top: 509,
            left: 15,
            child: Container(),
          ),
           const Positioned(
            top: 253,
            left: 79,
            child: Text(
              'LOGIN',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(53, 114, 239, 1),
                fontFamily: 'DM Sans',
                fontSize: 50,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 110,
            left: 105,
            child: Container(
              width: 150,
              height: 153,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bmslogo.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
           const Positioned(
            top: 350,
            left: 35,
            child: Text(
              'EMAIL',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'DM Sans',
                fontSize: 19,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
           const Positioned(
            top: 472,
            left: 28,
            child: Text(
              'PASSWORD',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'DM Sans',
                fontSize: 19,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
           const Positioned(
            top: 573,
            left: 200,
            child: Text(
              'Forgot Password',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontFamily: 'DM Sans',
                fontSize: 19,
                letterSpacing: 0,
                fontWeight: FontWeight.normal,
                height: 1,
              ),
            ),
          ),
          Positioned(
            top: 653,
            left: 23,
            child: Container(
              decoration: const BoxDecoration(),
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'LOGIN',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
