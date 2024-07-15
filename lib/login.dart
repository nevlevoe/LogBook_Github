import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'passwordreset.dart';  // Import the PasswordReset screen
import 'homepage.dart';  // Import the Homepage screen

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _teacheridController = TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  void _login() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Query the Teacher collection for the entered email and password
      QuerySnapshot snapshot = await firestore
          .collection('Teacher')
          .where('CollegeEmail', isEqualTo: _emailController.text)
          .where('Password', isEqualTo: _passwordController.text)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Fetch the TeacherID from the document
        String teacherId = snapshot.docs.first.get('TeacherID');
        _teacheridController.text = teacherId;

        // Navigate to the Homepage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomepageWidget(teacherid: _teacheridController.text)),
        );
      } else {
        // Show an error message if no match is found
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Wrong username or password')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _navigateToPasswordReset(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PasswordresetWidget()),
    );
  }

  Future<void> _signInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId: '546715749052-surimq7lh7f4k2t54ijum88vt8gf5jh3.apps.googleusercontent.com',  // Replace with your actual client ID
      );
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _firebaseAuth.signInWithCredential(credential);

        // Fetch the TeacherID from Firestore
        FirebaseFirestore firestore = FirebaseFirestore.instance;
        QuerySnapshot snapshot = await firestore
            .collection('Teacher')
            .where('CollegeEmail', isEqualTo: _emailController.text)
            .get();

        if (snapshot.docs.isNotEmpty) {
          String teacherId = snapshot.docs.first.get('TeacherID');
          _teacheridController.text = teacherId;

          // Navigate to the Homepage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomepageWidget(teacherid: _teacheridController.text)),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 115,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 150,
                  height: 153,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bmslogo.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 278,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "TEACHER'S LOGIN",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(53, 114, 239, 1),
                    fontFamily: 'DM Sans',
                    fontSize: 32,
                    fontWeight: FontWeight.normal,
                    height: 1,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 353,
              left: 23,
              child: Text(
                'EMAIL',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 382,
              left: 23,
              right: 23,
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your email',
                ),
              ),
            ),
            Positioned(
              top: 476,
              left: 23,
              child: Text(
                'PASSWORD',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'DM Sans',
                  fontSize: 19,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ),
            Positioned(
              top: 509,
              left: 23,
              right: 23,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Positioned(
              top: 573,
              right: 23,
              child: ElevatedButton(
                onPressed: () => _navigateToPasswordReset(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                ),
                child: Text(
                  'Forgot Password',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'DM Sans',
                    fontSize: 19,
                    fontWeight: FontWeight.normal,
                    height: 1,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 639,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: _login,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(202, 214, 255, 1),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ],
                    color: Color.fromRGBO(53, 114, 239, 1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 700,
              left: 20,
              right: 20,
              child: GestureDetector(
                onTap: _signInWithGoogle,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(202, 214, 255, 1),
                        offset: Offset(0, 10),
                        blurRadius: 20,
                      )
                    ],
                    color: Colors.red, // Google's primary color
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Center(
                    child: Text(
                      'Sign in with Google',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        height: 1,
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
