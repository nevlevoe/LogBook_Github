import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';  // Import for BackdropFilter

import 'menu.dart';  // Make sure to import your HomepageindexWidget
import 'classoptions.dart';  // Make sure to import your ClassOptions widget

class HomepageWidget extends StatefulWidget {
  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  bool _showDialog = false;

  void _openMenu() {
    setState(() {
      _showDialog = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: HomepageindexWidget(),
        );
      },
    ).then((value) {
      setState(() {
        _showDialog = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = 150;
    double containerSpacing = 20;
    double totalContainerWidth = containerWidth * 2 + containerSpacing;
    double leftMargin = (screenWidth - totalContainerWidth) / 2;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 114, 239, 1),
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.white),
                          onPressed: _openMenu,
                        ),
                        Text(
                          'Home',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'DM Sans',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 94,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      width: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: SvgPicture.asset(
                              'assets/images/vector.svg',
                              semanticsLabel: 'vector',
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Today’s classes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                        color: Color.fromRGBO(53, 114, 239, 1),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      child: Text(
                        '+ ADD CLASS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontFamily: 'DM Sans',
                          fontSize: 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 141,
                  left: leftMargin,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ClassaWidget()),  // Navigate to ClassOptions widget
                      );
                    },
                    child: Container(
                      width: containerWidth,
                      height: containerWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                        color: Color.fromRGBO(255, 153, 0, 0.67),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '4C',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 0.83),
                                fontFamily: 'DM Serif Text',
                                fontSize: 48,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              '9:50-10:45',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'DM Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Cryptography',
                              style: TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'DM Sans',
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 141,
                  left: leftMargin + containerWidth + containerSpacing,
                  child: Container(
                    width: containerWidth,
                    height: containerWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4,
                        ),
                      ],
                      color: Color.fromRGBO(87, 222, 23, 1),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '4B',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.83),
                              fontFamily: 'DM Serif Text',
                              fontSize: 48,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '12:10-1:05',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.92),
                              fontFamily: 'DM Sans',
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Cryptography',
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 0.85),
                              fontFamily: 'DM Sans',
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_showDialog)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
        ],
      ),
    );
  }
}