import 'package:flutter/material.dart';
import 'package:qr_scan_slt/dbHelper/mongodb.dart';

class Summery extends StatefulWidget {
  const Summery({super.key});

  @override
  _SummeryState createState() => _SummeryState();
}

class _SummeryState extends State<Summery> {
  Map<String, int> ticketCounts = {
    'total': 0,
    'normal': 0,
    'vip': 0,
    'vvip': 0,
  };

  @override
  void initState() {
    super.initState();
    fetchTicketCounts();
  }

  // Fetch ticket counts from MongoDB
  Future<void> fetchTicketCounts() async {
    try {
      final counts = await MongoDatabase.getTicketCounts();
      setState(() {
        ticketCounts = counts ?? {
          'total': 0,
          'normal': 0,
          'vip': 0,
          'vvip': 0,
        };
      });
    } catch (e) {
      debugPrint('Error fetching ticket counts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D), // Background color for the page
      body: Column(
        children: [
          // Title for Summery
          Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: const Text(
              'Summery',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Subtitle for Void Ticket Count
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              'Void Ticket Count',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[400],
              ),
            ),
          ),
          // Ticket counts fetched from MongoDB
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                buildTicketCard('Total count', '${ticketCounts['total']}'),
                buildTicketCard('Normal Tickets', '${ticketCounts['normal']}'),
                buildTicketCard('VIP Tickets', '${ticketCounts['vip']}'),
                buildTicketCard('VVIP Tickets', '${ticketCounts['vvip']}'),
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
          color: Colors.blueAccent, // Blue background color for the card
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
                color: Colors.lightBlue, // Update this color to your desired color for inner boxes
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  count,
                  style: const TextStyle(
                    color: Colors.black, // Update text color if needed
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
