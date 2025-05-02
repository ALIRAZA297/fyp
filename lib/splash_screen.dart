import 'package:flutter/material.dart';
import 'SignUpSelectionScreen.dart'; // Ye signup page ke liye

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 5 seconds ke baad signup screen pe le jaega
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpSelectionScreen()),
      );
    });

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
                // Top icons (WiFi, Battery, Signal)

                // MaidConnect icons (bucket and mop)
                Column(
                  children: [
                    Image.asset(
                      'images/iconss.png', // Apni image ka correct path
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
                      "Hire with Cofidence, Work with Dignity!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Large container with image
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage('images/maid.webp'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                Spacer(),
                // Loading indicator
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}