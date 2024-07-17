import 'package:flutter/material.dart';
import 'package:logbook/profile.dart';

import 'coe.dart';
import 'homepage.dart';
import 'login.dart';

class HomepageindexWidget extends StatefulWidget {
final String teacherId;

HomepageindexWidget({required this.teacherId});

@override
_HomepageindexWidgetState createState() => _HomepageindexWidgetState();
}

class _HomepageindexWidgetState extends State<HomepageindexWidget> {
  String _activeButton = '';

  void _navigateTo(Widget destinationWidget) {
    setState(() {
      _activeButton = destinationWidget.runtimeType.toString();
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => destinationWidget),
    ).then((_) {
      setState(() {
        _activeButton = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomepageWidget(teacherid: widget.teacherId,)),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.3), // Blur background
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                insetPadding: EdgeInsets.only(left: 0, right: MediaQuery.of(context).size.width * 0.2),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 0,
                          left: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(53, 114, 239, 1),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                            ),
                            child: Center(
                              child: Text(
                                'Menu',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'DM Sans',
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 20,
                          right: 20,
                          bottom: 20, // Ensure content does not overflow
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _buildMenuLink(
                                  context,
                                  'Home',
                                  HomepageWidget(teacherid: widget.teacherId,),
                                  _activeButton == 'HomepageWidget',
                                ),
                                _buildMenuLink(
                                  context,
                                  'Profile',
                                  ProfileWidget(teacherId: widget.teacherId, ),
                                  _activeButton == 'ProfileWidget',
                                ),
                                _buildMenuLink(
                                  context,
                                  'Calendar of Events',
                                  CoeWidget(teacherId: widget.teacherId,),
                                  _activeButton == 'CoeWidget',
                                ),
                                _buildMenuLink(
                                  context,
                                  'Logout',
                                  LoginWidget(),
                                  _activeButton == 'LoginWidget',
                                  isLogout: true,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuLink(
      BuildContext context,
      String title,
      Widget destinationWidget,
      bool isActive, {
        bool isLogout = false,
      }) {
    return GestureDetector(
      onTap: () => _navigateTo(destinationWidget),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.yellow : (isLogout ? Colors.red : Colors.black),
            fontFamily: 'DM Sans',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: 1.3,
          ),
        ),
      ),
    );
  }
}