import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'menu.dart'; // Ensure you import the HomepageWidget

class ProfileWidget extends StatefulWidget {
  final String teacherId;

  ProfileWidget({
    required this.teacherId,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String teacherFname = '';
  String teacherLname = '';
  String departmentName = '';
  int classesHandled = 0;
  int coursesHandled = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      // Fetch teacher data
      DocumentSnapshot teacherSnapshot = await FirebaseFirestore.instance
          .collection('Teacher')
          .doc(widget.teacherId)
          .get();

      if (teacherSnapshot.exists) {
        var teacherData = teacherSnapshot.data() as Map<String, dynamic>;
        String departmentId = teacherData['DepartmentID'];

        print('Teacher Data: $teacherData');

        setState(() {
          teacherFname = teacherData['TeacherFname'];
          teacherLname = teacherData['TeacherLname'];
        });

        // Fetch department data
        DocumentSnapshot departmentSnapshot = await FirebaseFirestore.instance
            .collection('Department')
            .doc(departmentId)
            .get();

        if (departmentSnapshot.exists) {
          var departmentData =
          departmentSnapshot.data() as Map<String, dynamic>;

          print('Department Data: $departmentData');

          setState(() {
            departmentName = departmentData['DepartmentName'];
          });
        }
      }

      // Fetch classes handled count
      QuerySnapshot classesSnapshot = await FirebaseFirestore.instance
          .collection('Classes')
          .where('TeacherID', isEqualTo: widget.teacherId)
          .get();

      print('Classes Handled: ${classesSnapshot.docs.length}');

      setState(() {
        classesHandled = classesSnapshot.docs.length;
      });

      // Fetch courses handled count
      QuerySnapshot coursesSnapshot = await FirebaseFirestore.instance
          .collection('FacultyHandling')
          .where('TeacherID', isEqualTo: widget.teacherId)
          .get();

      print('Courses Handled: ${coursesSnapshot.docs.length}');

      setState(() {
        coursesHandled = coursesSnapshot.docs.length;
      });
    } catch (e) {
      print('Error fetching data: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomepageindexWidget(
                              teacherId: widget.teacherId,
                            ),
                          ),
                        );
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
                    '$teacherFname $teacherLname', // Teacher's name
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    departmentName, // Teacher's department name
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
                                '$coursesHandled', // Number of courses handled
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
                                '$classesHandled', // Number of classes handled
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
