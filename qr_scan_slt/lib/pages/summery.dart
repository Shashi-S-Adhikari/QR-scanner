import 'package:flutter/material.dart';

class Summery extends StatelessWidget {
  const Summery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Summery'),
        backgroundColor: Colors.grey[850], // Dark grey background for AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Tab switcher between History and Summery
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // History Tab
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/history'); // Navigate to history page
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'History',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 50),
                // Summery Tab
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 45.0),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Summery',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              'Ticket Count',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 50),
            // Card for "No Of Tickets"
            buildTicketCard('No Of Tickets', '2'),
            const SizedBox(height: 50),
            // Card for "Normal Tickets"
            buildTicketCard('Normal Tickets', ''),
            const SizedBox(height: 50),
            // Card for "VIP Tickets"
            buildTicketCard('VIP Tickets', '2'),
            const SizedBox(height: 50),
            // Card for "VVIP Tickets"
            buildTicketCard('VVIP Tickets', ''),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900], // Background color for the entire page
    );
  }

  // Method to create each ticket count card
  Widget buildTicketCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey[850],
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
              color: Colors.grey[50],
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
    );
  }
}
