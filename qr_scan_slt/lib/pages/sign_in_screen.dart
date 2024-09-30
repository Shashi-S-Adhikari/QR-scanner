import 'package:flutter/material.dart';
import 'package:qr_scan_slt/home_page.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 100),
            Text(
              "please Provide the Following Information",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 50),
            // User Name field with updated color
            SizedBox(
              height: 80,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "User Name",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9), // Updated color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Password field with updated color
            SizedBox(
              height: 80,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9), // Updated color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                obscureText: true,
              ),
            ),
            SizedBox(height: 10),
            // Phone No field with updated color
            SizedBox(
              height: 80,
              width: double.infinity,
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone No",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9), // Updated color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(height: 10),
            // Dropdown field with updated color
            SizedBox(
              height: 80,
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select The Event",
                  filled: true,
                  fillColor: Color(0xFFD9D9D9), // Updated color
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Deep Jungle Reggae Stage 2024"),
                    value: "Event",
                  ),
                ],
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 20),
            // Elevated button for Verify action
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
              child: Text("Verify"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50), // Adjusted button height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:qr_scan_slt/home_page.dart';
//
// class SignInScreen extends StatelessWidget {
//   const SignInScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Sign In",
//               style: TextStyle(
//                 fontSize: 42,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 100),
//             Text(
//               "please Provide the Following Information",
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "User Name",
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Password",
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//               obscureText: true,
//             ),
//             SizedBox(height: 10),
//             TextField(
//               decoration: InputDecoration(
//                 labelText: "Phone No",
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//               keyboardType: TextInputType.phone,
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.grey[200],
//               ),
//               items: [
//                 DropdownMenuItem(
//                   child: Text("Select the Event"),
//                   value: "Event",
//                 ),
//               ],
//               onChanged: (value) {},
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => Homepage()),
//                 );
//               },
//               child: Text("Verify"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
