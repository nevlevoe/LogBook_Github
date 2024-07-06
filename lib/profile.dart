import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: screenWidth,
                height: 70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(53, 114, 239, 1),
                ),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/homepageindex'); // Navigate to menu.dart
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'DM Sans',
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Profile content
            Positioned(
              top: 100,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dr. John Doe', // Teacher's name
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Senior Lecturer', // Teacher's designation
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueAccent.withOpacity(0.2),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Courses Handled',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '5', // Number of courses handled
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.greenAccent.withOpacity(0.2),
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Classes Handled',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '20', // Number of classes handled
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add floating back button
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pop(context); // Navigate to the previous screen
                },
                label: Container(
                  width: screenWidth - 20, // To ensure the button is 100% width
                  alignment: Alignment.center,
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DM Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                backgroundColor: Color.fromRGBO(53, 114, 239, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}