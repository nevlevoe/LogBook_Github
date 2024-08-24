import 'package:flutter/material.dart';
import 'menu.dart'; // Import the menu.dart file

class CoeWidget extends StatefulWidget {
  final String teacherId;

  CoeWidget({required this.teacherId});

  @override
  _CoeWidgetState createState() => _CoeWidgetState();
}

class _CoeWidgetState extends State<CoeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar with title and menu icon on the left
            Container(
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color.fromRGBO(53, 114, 239, 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // Align elements to the left
                children: [
                  // Menu Icon on the left
                  IconButton(
                    icon: Icon(Icons.menu, color: Colors.white), // Menu icon in white
                    onPressed: () {
                      // Navigate to menu.dart
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomepageindexWidget(teacherId: widget.teacherId),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 16), // Space between the menu icon and the title
                  // Title in the center
                  Text(
                    'BMSCELogbook',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'DM Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Calendar Row
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  // Calendar Icon
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/Calendar_month_24dp_fill0_wght400_grad0_opsz2411.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  // Calendar of events text
                  Text(
                    'Calendar of Events',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'DM Sans',
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Expanded Scrollable Image
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding to avoid screen edges
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allow horizontal scrolling
                  child: Center(
                    child: Container(
                      width: 1200, // Define a large width for horizontal scrolling
                      height: double.infinity, // Full height of available space
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Screenshot20240614at12101.png'),
                          fit: BoxFit.contain, // Keep the aspect ratio of the image intact
                        ),
                      ),
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
}
