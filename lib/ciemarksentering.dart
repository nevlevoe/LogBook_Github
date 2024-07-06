import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'menu.dart'; // Import your existing MenuPage

class CieandseeWidget extends StatefulWidget {
  @override
  _CieandseeWidgetState createState() => _CieandseeWidgetState();
}

class _CieandseeWidgetState extends State<CieandseeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) => HomepageindexWidget(), // Navigate to your existing MenuPage
              ),
            );
          },
        ),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'CIE AND SEE',
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Color.fromRGBO(255, 255, 255, 1),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Color.fromRGBO(53, 114, 239, 1),
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
