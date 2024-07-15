import 'package:flutter/material.dart';
import 'dart:ui'; // Import for BackdropFilter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'menu.dart'; // Make sure to import your HomepageindexWidget
import 'classoptions.dart'; // Make sure to import your ClassOptions widget
import 'dart:math'; // Import for randomizing colors

class HomepageWidget extends StatefulWidget {
  final String teacherid;

  HomepageWidget({required this.teacherid});

  @override
  _HomepageWidgetState createState() => _HomepageWidgetState();
}

class _HomepageWidgetState extends State<HomepageWidget> {
  bool _showDialog = false;
  final TextEditingController _semController = TextEditingController();
  final TextEditingController _sectionController = TextEditingController();
  final TextEditingController _teacheridController = TextEditingController();
  final TextEditingController _subjectidclassesController = TextEditingController();
  final TextEditingController _subjectidsubjectdetailsController = TextEditingController();
  final TextEditingController _subjectnameController = TextEditingController();
  final TextEditingController _classidController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  List<Map<String, String>> classDetails = [];
  final List<Color> colors = [Color.fromRGBO(87, 222, 23, 1), Colors.yellow, Colors.pinkAccent, Colors.red, Colors.deepOrangeAccent]; // List of colors

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

  Future<void> _fetchHomepageData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      print(widget.teacherid);
      QuerySnapshot classesSnapshot = await firestore
          .collection('Classes')
          .where('TeacherID', isEqualTo: widget.teacherid)
          .get();

      for (var classDoc in classesSnapshot.docs) {
        QuerySnapshot subjectSnapshot = await firestore
            .collection('SubjectDetails')
            .where('SubjectID', isEqualTo: classDoc['SubjectID'])
            .get();

        for (var subjectDoc in subjectSnapshot.docs) {
          classDetails.add({
            'ClassId': classDoc['ClassID'],
            'Semester': classDoc['Semester'],
            'Section': classDoc['Section'],
            'SubjectID': classDoc['SubjectID'],
            'SubjectName': subjectDoc['SubjectName'],
          });
        }
      }

      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    if (classDetails.isEmpty) {
      _fetchHomepageData();
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = 150;
    double containerSpacing = 20;
    double totalContainerWidth = containerWidth * 2 + containerSpacing;
    double leftMargin = (screenWidth - totalContainerWidth) / 2;
    Random random = Random();

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
                            fontWeight: FontWeight.bold, // Bold text
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
                      width: 250, // Increased width to accommodate image
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            child: Image.asset(
                              'assets/school.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Your classes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'DM Sans',
                              fontSize: 18, // Increased font size
                              letterSpacing: 0,
                              fontWeight: FontWeight.bold, // Bold text
                              height: 1.7,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 141,
                  left: leftMargin,
                  right: leftMargin,
                  child: Center(
                    child: Wrap(
                      spacing: containerSpacing,
                      runSpacing: containerSpacing,
                      children: classDetails.map((classDetail) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ClassaWidget(
                                  classId: classDetail['ClassId']!,
                                  teacherId: widget.teacherid,
                                  subjectId: classDetail['SubjectID']!,
                                  semester: classDetail['Semester']!,
                                  section: classDetail['Section']!,
                                  subject: classDetail['SubjectName']!,
                                ),
                              ),
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
                              color: colors[random.nextInt(colors.length)], // Random color
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    classDetail['Semester'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 0.83),
                                      fontFamily: 'DM Serif Text',
                                      fontSize: 48,
                                      fontWeight: FontWeight.bold, // Bold text
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    classDetail['Section'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'DM Sans',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold, // Bold text
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    classDetail['SubjectName'] ?? '',
                                    style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'DM Sans',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold, // Bold text
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
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
