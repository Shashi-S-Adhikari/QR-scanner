import 'package:flutter/material.dart';
import 'package:qr_scan_slt/home_page.dart';  // Make sure this path is correct

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Uniform padding
        child: Center(
          child: SingleChildScrollView( // Allows scrolling if the keyboard opens
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign In Header
                Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 20),
                // Instruction Text
                Text(
                  "Please Provide the Following Information",
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                // User Name field
                _buildTextField("User Name"),
                SizedBox(height: 16),
                // Password field
                _buildTextField("Password", obscureText: true),
                SizedBox(height: 16),
                // Phone No field
                _buildTextField("Phone No", keyboardType: TextInputType.phone),
                SizedBox(height: 40),
                // Elevated button for Verify action
                _buildVerifyButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, {bool obscureText = false, TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Color(0xFFD9D9D9), // Light grey color
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildVerifyButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),  // Updated to match the correct class name
        );
      },
      child: Text("Verify"),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueAccent,
        minimumSize: Size(double.infinity, 50), // Full width button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Rounded button
        ),
      ),
    );
  }
}
