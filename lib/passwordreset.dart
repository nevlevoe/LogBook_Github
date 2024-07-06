import 'package:flutter/material.dart';
import 'dart:ui';

import 'overlaypasswordreset.dart';

class PasswordresetWidget extends StatefulWidget {
  @override
  _PasswordresetWidgetState createState() => _PasswordresetWidgetState();
}

class _PasswordresetWidgetState extends State<PasswordresetWidget> {
  final TextEditingController _emailController = TextEditingController();
  bool _showConfirmation = false;

  void _sendResetLink() {
    final email = _emailController.text;
    // Add your password reset logic here
    print('Sending password reset link to $email');
    // Show a snackbar or dialog to inform the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Password reset link sent to $email')),
    );
    // Show confirmation screen with blur effect
    setState(() {
      _showConfirmation = true;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  top: 115,
                  left: (MediaQuery.of(context).size.width - 150) / 2,
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
                Positioned(
                  top: 278,
                  left: 26,
                  right: 26,
                  child: Text(
                    'PASSWORD RESET',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(53, 114, 239, 1),
                      fontFamily: 'Poppins',
                      fontSize: 32,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                Positioned(
                  top: 352,
                  left: 44,
                  right: 44,
                  child: Text(
                    'Enter your college email.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      height: 1,
                    ),
                  ),
                ),
                Positioned(
                  top: 419,
                  left: 20,
                  right: 20,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Positioned(
                  top: 539,
                  left: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: _sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(53, 114, 239, 1),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 10,
                      shadowColor: Color.fromRGBO(202, 214, 255, 1),
                    ),
                    child: Text(
                      'Send Reset Link',
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
              ],
            ),
          ),
          if (_showConfirmation)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                color: Colors.black.withOpacity(0.5),
                child: Center(
                  child: Frame2610316Widget(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}