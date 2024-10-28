import 'package:flutter/material.dart';
import 'package:qr_scan_slt/dbHelper/mongodb.dart';

class Summery extends StatefulWidget {
  const Summery({super.key});

  @override
  _SummeryState createState() => _SummeryState();
}

class _SummeryState extends State<Summery> {
  Map<String, int> ticketCounts = {
    'normal': 0,
    'vip': 0,
    'vvip': 0,
    'total': 0,
  };

  @override
  void initState() {
    super.initState();
    fetchTicketCounts();
  }

  // Method to fetch ticket counts from the database
  Future<void> fetchTicketCounts() async {
    try {
      await MongoDatabase.connect(); // Ensure the database is connected
      final counts = await MongoDatabase.getTicketCounts();
      debugPrint('Fetched ticket counts: $counts'); // Debug print statement
      setState(() {
        ticketCounts = counts ?? {
          'normal': 0,
          'vip': 0,
          'vvip': 0,
          'total': 0,
        };
      });
    } catch (e) {
      // Handle any errors that occur during the fetch
      debugPrint('Error fetching ticket counts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: const Text(
              'Summary',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Ticket Counts',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                buildTicketCard('Total Tickets', '${ticketCounts['total'] ?? 0}'),
                buildTicketCard('Normal Tickets', '${ticketCounts['normal'] ?? 0}'),
                buildTicketCard('VIP Tickets', '${ticketCounts['vip'] ?? 0}'),
                buildTicketCard('VVIP Tickets', '${ticketCounts['vvip'] ?? 0}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to create each ticket count card
  Widget buildTicketCard(String title, String count) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 100,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  count,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
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
// import 'package:flutter/material.dart';
// import 'package:qr_scan_slt/dbHelper/mongodb.dart';
//
// class Summery extends StatefulWidget {
//   const Summery({super.key});
//
//   @override
//   _SummeryState createState() => _SummeryState();
// }
//
// class _SummeryState extends State<Summery> {
//   Map<String, int> ticketCounts = {
//     'normal': 0,
//     'vip': 0,
//     'vvip': 0,
//     'total': 0,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     fetchTicketCounts();
//   }
//
//   // Method to fetch ticket counts from the database
//   Future<void> fetchTicketCounts() async {
//     try {
//       await MongoDatabase.connect(); // Ensure the database is connected
//       final counts = await MongoDatabase.getTicketCounts();
//       debugPrint('Fetched ticket counts: $counts'); // Debug print statement
//       setState(() {
//         ticketCounts = counts ?? {
//           'normal': 0,
//           'vip': 0,
//           'vvip': 0,
//           'total': 0,
//         };
//       });
//     } catch (e) {
//       // Handle any errors that occur during the fetch
//       debugPrint('Error fetching ticket counts: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2D2D2D),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
//             child: const Text(
//               'Summery',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Text(
//               'Void Ticket Count',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               children: [
//                 buildTicketCard('Total count', '${ticketCounts['total'] ?? 0}'),
//                 buildTicketCard('Normal Tickets', '${ticketCounts['normal'] ?? 0}'),
//                 buildTicketCard('VIP Tickets', '${ticketCounts['vip'] ?? 0}'),
//                 buildTicketCard('VVIP Tickets', '${ticketCounts['vvip'] ?? 0}'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to create each ticket count card
//   Widget buildTicketCard(String title, String count) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//         decoration: BoxDecoration(
//           color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 7,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               width: 100,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   count,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:qr_scan_slt/dbHelper/mongodb.dart';
//
// class Summery extends StatefulWidget {
//   const Summery({super.key});
//
//   @override
//   _SummeryState createState() => _SummeryState();
// }
//
// class _SummeryState extends State<Summery> {
//   Map<String, int> ticketCounts = {
//     'normal': 0,
//     'vip': 0,
//     'vvip': 0,
//     'total': 0,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     fetchTicketCounts();
//   }
//
//   // Method to fetch ticket counts from the database
//   Future<void> fetchTicketCounts() async {
//     try {
//       await MongoDatabase.connect(); // Ensure the database is connected
//       final counts = await MongoDatabase.getTicketCounts();
//       setState(() {
//         ticketCounts = counts;
//       });
//     } catch (e) {
//       // Handle any errors that occur during the fetch
//       debugPrint('Error fetching ticket counts: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2D2D2D),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
//             child: const Text(
//               'Summery',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Text(
//               'Void Ticket Count',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               children: [
//                 buildTicketCard('Total count', '${ticketCounts['total']}'),
//                 buildTicketCard('Normal Tickets', '${ticketCounts['normal']}'),
//                 buildTicketCard('VIP Tickets', '${ticketCounts['vip']}'),
//                 buildTicketCard('VVIP Tickets', '${ticketCounts['vvip']}'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to create each ticket count card
//   Widget buildTicketCard(String title, String count) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//         decoration: BoxDecoration(
//           color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 7,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               width: 100,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   count,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:qr_scan_slt/dbHelper/mongodb.dart';
//
// class Summery extends StatefulWidget {
//   const Summery({super.key});
//
//   @override
//   _SummeryState createState() => _SummeryState();
// }
//
// class _SummeryState extends State<Summery> {
//   Map<String, int> ticketCounts = {
//     'normal': 0,
//     'vip': 0,
//     'vvip': 0,
//     'total': 0,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     fetchTicketCounts();
//   }
//
//   Future<void> fetchTicketCounts() async {
//     final counts = await MongoDatabase.getTicketCounts();
//     setState(() {
//       ticketCounts = counts;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF2D2D2D),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
//             child: const Text(
//               'Summery',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Text(
//               'Void Ticket Count',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               children: [
//                 buildTicketCard('Total count', '${ticketCounts['total']}'),
//                 buildTicketCard('Normal Tickets', '${ticketCounts['normal']}'),
//                 buildTicketCard('VIP Tickets', '${ticketCounts['vip']}'),
//                 buildTicketCard('VVIP Tickets', '${ticketCounts['vvip']}'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTicketCard(String title, String count) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//         decoration: BoxDecoration(
//           color: Colors.blueAccent,
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 7,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               width: 100,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   count,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class Summery extends StatelessWidget {
//   const Summery({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF2D2D2D), // Background color for the page
//       body: Column(
//         children: [
//           // Title for Summery
//           Padding(
//             padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
//             child: Text(
//               'Summery',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//           // Subtitle for Void Ticket Count
//           Padding(
//             padding: const EdgeInsets.only(bottom: 20.0),
//             child: Text(
//               'Void Ticket Count',
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ),
//           // Dummy summery content (like in the image)
//           Expanded(
//             child: ListView(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               children: [
//                 buildTicketCard('Total count', '1000'),
//                 buildTicketCard('Normal Tickets', '500'),
//                 buildTicketCard('VIP Tickets', '250'),
//                 buildTicketCard('VVIP Tickets', '250'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Method to create each ticket count card
//   Widget buildTicketCard(String title, String count) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//         decoration: BoxDecoration(
//           color: Colors.blueAccent, // Blue background color for the card
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               spreadRadius: 2,
//               blurRadius: 7,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Container(
//               width: 100,
//               height: 60,
//               decoration: BoxDecoration(
//                 color: Colors.lightBlue, // Update this color to your desired color for inner boxes
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Center(
//                 child: Text(
//                   count,
//                   style: const TextStyle(
//                     color: Colors.black, // Update text color if needed
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// // import 'package:flutter/material.dart';
// //
// // class Summery extends StatelessWidget {
// //   const Summery({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Summery'),
// //         backgroundColor: Colors.grey[900], // Dark grey background for AppBar
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.menu),
// //             onPressed: () {
// //               // Handle menu button press
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             // Tab switcher between History and Summery
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 // History Tab
// //                 GestureDetector(
// //                   onTap: () {
// //                     Navigator.pushNamed(context, '/history'); // Navigate to history page
// //                   },
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey,
// //                       borderRadius: BorderRadius.circular(20),
// //                     ),
// //                     child: const Text(
// //                       'History',
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: 16),
// //                 // Summery Tab
// //                 Container(
// //                   padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
// //                   decoration: BoxDecoration(
// //                     color: Colors.blueAccent,
// //                     borderRadius: BorderRadius.circular(20),
// //                   ),
// //                   child: const Text(
// //                     'Summery',
// //                     style: TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.bold,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 40),
// //             const Text(
// //               'Ticket Count',
// //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
// //             ),
// //             const SizedBox(height: 25),
// //             // Card for "No Of Tickets"
// //             buildTicketCard('No Of Tickets', '1000'),
// //             const SizedBox(height: 30),
// //             // Card for "Normal Tickets"
// //             buildTicketCard('Normal Tickets', '500'),
// //             const SizedBox(height: 30),
// //             // Card for "VIP Tickets"
// //             buildTicketCard('VIP Tickets', '250'),
// //             const SizedBox(height: 30),
// //             // Card for "VVIP Tickets"
// //             buildTicketCard('VVIP Tickets', '250'),
// //           ],
// //         ),
// //       ),
// //       backgroundColor: Colors.grey[900], // Background color for the entire page
// //     );
// //   }
// //
// //   // Method to create each ticket count card
// //   Widget buildTicketCard(String title, String count) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
// //       decoration: BoxDecoration(
// //         color: Colors.grey[850],
// //         borderRadius: BorderRadius.circular(15),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.1),
// //             spreadRadius: 2,
// //             blurRadius: 7,
// //             offset: const Offset(0, 3),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             title,
// //             style: const TextStyle(
// //               color: Colors.white,
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           Container(
// //             width: 70,
// //             height: 40,
// //             decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(10),
// //             ),
// //             child: Center(
// //               child: Text(
// //                 count,
// //                 style: const TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
