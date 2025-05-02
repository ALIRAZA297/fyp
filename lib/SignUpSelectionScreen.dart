import 'package:flutter/material.dart';
import '../ServiceProviderFormScreen.dart';
import 'maid_signup_screen.dart';

class SignUpSelectionScreen extends StatelessWidget {
  const SignUpSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F6E8), // Light background color
      body: SafeArea(
        child: Stack(
          children: [
            // Light blue background design
            Positioned(
              top: -150,
              left: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // MaidConnect icons (bucket and mop)
                Column(
                  children: [
                    Image.asset(
                      'images/iconss.png', // Correct path to your icon
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "MaidConnect",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Hire with Confidence, Work with Dignity!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                // Sign Up Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You want to ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlue,
                      ),
                    ),
                    Text(
                      " as a",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Service Seeker Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.blue[300]!, width: 2),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceProviderFormScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Service Seeker",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
// Service Provider Button
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      padding: EdgeInsets.symmetric(horizontal: 60, vertical: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.blue[300]!, width: 2),
                      ),
                    ),
                    onPressed: () {
                      // Navigation to MaidSignupScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MaidSignupScreen()),
                      );
                    },
                    child: Text(
                      "Service Provider",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Already have an account link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to Sign In screen (To be implemented)
                    },
                    child: Text(
                      "Already have an account\nSign In",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.lightBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Admin Panel Link
                // Center(
                //   child: GestureDetector(
                //     onTap: () {
                //       // Navigate to Admin Panel screen
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //           builder: (context) => AdminPanelScreen(),
                //         ),
                //       );
                //     },
                //     child: Text(
                //       "Admin Panel",
                //       textAlign: TextAlign.center,
                //       style: TextStyle(
                //         fontSize: 14,
                //         color: Colors.lightBlue,
                //         decoration: TextDecoration.underline,
                //         decorationColor: Colors.lightBlue,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}