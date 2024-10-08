import 'package:flutter/material.dart';
import 'qr_scan.dart';  // Import the QrScan page

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Page'),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,  // Remove default back button
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to QrScan
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const QrScan(),
              ),
            );
          },
        ),
        elevation: 0,  // Remove shadow/elevation
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Deep Jungle Reggae Stage\n2024',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Purchase Information',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            const Text(
              'Ticket Number',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 5),
            const Text(
              '000123764',  // Example ticket number
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildTicketInfoRow('No Of Booked Tickets', '5'),
                  const SizedBox(height: 20),
                  _buildTicketInfoRow('No Of Scanned Tickets', '3'),
                  const SizedBox(height: 20),
                  _buildTicketInfoRow('No Of Void Tickets', '2'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create the ticket information rows
  Widget _buildTicketInfoRow(String label, String count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blueAccent,
          child: Text(
            count,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
