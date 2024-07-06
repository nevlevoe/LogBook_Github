import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'menu.dart';
class ClassaMarkattendanceWidget extends StatefulWidget {
  @override
  _ClassaMarkattendanceWidgetState createState() => _ClassaMarkattendanceWidgetState();
}

class _ClassaMarkattendanceWidgetState extends State<ClassaMarkattendanceWidget> {
  // Initialize _isPresent with a default value
  List<bool?> _isPresent = List<bool?>.filled(5, null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'MARK ATTENDANCE',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontFamily: 'Poppins',
              fontSize: 20,
              letterSpacing: 0,
              fontWeight: FontWeight.normal,
              height: 1,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomepageindexWidget()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20), // Adjust top spacing as needed
              Expanded(
                child: ListView.builder(
                  itemCount: _isPresent.length, // Adjust number of playcards as needed
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      height: 95,
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 14,
                            left: 0,
                            right: 0,
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              width: double.infinity,
                              height: 95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: LinearGradient(
                                  colors: _isPresent[index] == null
                                      ? [
                                    Colors.green.withOpacity(0.5),
                                    Colors.red.withOpacity(0.5),
                                  ]
                                      : _isPresent[index]!
                                      ? [
                                    Color(0xFF6FCF97),
                                    Color(0xFF3ABEF9),
                                  ]
                                      : [
                                    Color(0xFFFF6F61),
                                    Color(0xFF3ABEF9),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Text(
                                      'NAME',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Poppins',
                                        fontSize: 32,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.green,
                                          child: Text('P', style: TextStyle(color: Colors.white)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPresent[index] = true;
                                          });
                                        },
                                      ),
                                      IconButton(
                                        icon: CircleAvatar(
                                          backgroundColor: Colors.red,
                                          child: Text('A', style: TextStyle(color: Colors.white)),
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPresent[index] = false;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle submit logic here
        },
        label: Text(
          'Submit',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomepageindexWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}