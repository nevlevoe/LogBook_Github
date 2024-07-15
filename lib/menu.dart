import 'package:flutter/material.dart';

class HomepageindexWidget extends StatefulWidget {
  @override
  _HomepageindexWidgetState createState() => _HomepageindexWidgetState();
}

class _HomepageindexWidgetState extends State<HomepageindexWidget> {
  String _activeButton = '';

  void _navigateTo(String routeName) {
    setState(() {
      _activeButton = routeName;
    });
    Navigator.of(context).pushReplacementNamed(routeName).then((_) {
      // Optionally reset the active button state when returning from a route
      setState(() {
        _activeButton = '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              '/homepage',
                              _activeButton == '/homepage',
                            ),
                            _buildMenuLink(
                              context,
                              'Profile',
                              '/profile',
                              _activeButton == '/profile',
                            ),
                            _buildMenuLink(
                              context,
                              'Time Table',
                              '/timetable',
                              _activeButton == '/timetable',
                            ),
                            _buildMenuLink(
                              context,
                              'Calendar of Events',
                              '/calendarofevents',
                              _activeButton == '/calendarofevents',

                            ),
                            _buildMenuLink(
                              context,
                              'Logout',
                              '/login',
                              _activeButton == '/login',
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
        ],
      ),
    );
  }

  Widget _buildMenuLink(
      BuildContext context,
      String title,
      String routeName,
      bool isActive, {
        bool isLogout = false,
      }) {
    return GestureDetector(
      onTap: () => _navigateTo(routeName),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.6,
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? Colors.yellow : (isLogout ? Colors.red : Colors.black),
            fontFamily: 'DM Sans',
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: 1.3,
            decoration: TextDecoration.underline, // Underline to mimic hyperlink
          ),
        ),
      ),
    );
  }
}
