import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'cie1.dart';
import 'cie2.dart';
import 'cie3.dart';
import 'aat.dart';
import 'practicals.dart';


class CieandseeWidget extends StatefulWidget {
  final String classId;
  final String teacherId;
  final String subjectId;

  CieandseeWidget({
    required this.classId,
    required this.teacherId,
    required this.subjectId,
  });

  @override
  _CieandseeWidgetState createState() => _CieandseeWidgetState();
}

class _CieandseeWidgetState extends State<CieandseeWidget> {
  bool showPracticals = false;

  @override
  void initState() {
    super.initState();
    _checkCredits();
  }

  void _checkCredits() async {
    final subjectSnapshot = await FirebaseFirestore.instance
        .collection('SubjectDetails')
        .where('SubjectID', isEqualTo: widget.subjectId)
        .get();

    if (subjectSnapshot.docs.isNotEmpty) {
      final credits = subjectSnapshot.docs.first['Credits'];
      if (credits == 4) {
        setState(() {
          showPracticals = true;
        });
      }
    }
  }

  void _navigateToPage(String page) {
    switch (page) {
      case 'CIE1':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cie1(
              classId: widget.classId,
              teacherId: widget.teacherId,
              subjectId: widget.subjectId,
            ),
          ),
        );
        break;
      case 'CIE2':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cie2(
              classId: widget.classId,
              teacherId: widget.teacherId,
              subjectId: widget.subjectId,
            ),
          ),
        );
        break;
      case 'CIE3':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Cie3(
              classId: widget.classId,
              teacherId: widget.teacherId,
              subjectId: widget.subjectId,
            ),
          ),
        );
        break;
      case 'AAT/Projects/Quiz':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Aat(
              classId: widget.classId,
              teacherId: widget.teacherId,
              subjectId: widget.subjectId,
            ),
          ),
        );
        break;
      case 'Practicals':
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Practicals(
              classId: widget.classId,
              teacherId: widget.teacherId,
              subjectId: widget.subjectId,
            ),
          ),
        );
        break;
      default:
        print('Navigating to $page');
        break;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(53, 114, 239, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Transform.rotate(
          angle: 0.2591028889488524 * (math.pi / 180),
          child: Text(
            'CIE',
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
      body: Center(
        child: GridView.count(
          crossAxisCount: 3, // Number of items per row
          crossAxisSpacing: 20.0, // Increased horizontal spacing
          mainAxisSpacing: 20.0, // Increased vertical spacing
          padding: EdgeInsets.all(16.0),
          children: [
            _buildGridItem('CIE1'),
            _buildGridItem('CIE2'),
            _buildGridItem('CIE3'),
            _buildGridItem('AAT/Projects/Quiz'),
            if (showPracticals) _buildGridItem('Practicals'),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String title) {
    return GestureDetector(
      onTap: () => _navigateToPage(title),
      child: Container(
        width: 60, // Smaller width
        height: 60, // Smaller height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), // Smaller radius
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              offset: Offset(0, 2), // Adjust shadow offset
              blurRadius: 4, // Adjust blur radius
            ),
          ],
          color: Color.fromRGBO(255, 245, 198, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 45, // Adjust height for image
              child: Icon(
                Icons.book, // Placeholder icon
                size: 60, // Smaller icon size
                color: Colors.brown,
              ),
            ),
            SizedBox(height: 20), // Space between icon and text
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(165, 42, 42, 1),
                fontFamily: 'Poppins',
                fontSize: 15, // Smaller font size
                fontWeight: FontWeight.normal,
                height: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
