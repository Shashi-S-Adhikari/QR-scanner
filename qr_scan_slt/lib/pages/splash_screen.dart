import 'package:flutter/material.dart';
import 'package:qr_scan_slt/home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Background color of the splash screen
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo at the top
          Spacer(),
          Image.asset(
            'assets/Images/SLTickets.png',  // Add your logo image here
            height: 100,  // Adjust logo size as needed
          ),
          Spacer(),
          // Bottom Get Started section
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.blue,  // Background color for the bottom section
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  blurRadius: 10,
                  offset: Offset(0, -5),  // Adjust shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Divider(
                  color: Colors.white,
                  thickness: 3,
                  indent: 100,
                  endIndent: 100,
                ),
                SizedBox(height: 10),
                Text(
                  'Get Started',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Go and enjoy our features for free and make your life easy with us.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 20),
                // Navigate to HomePage when pressing the button
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Homepage()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.arrow_forward, color: Colors.blue, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
