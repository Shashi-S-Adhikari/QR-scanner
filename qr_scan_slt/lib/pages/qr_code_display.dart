import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'next_page.dart';


class QrCodeDisplay extends StatelessWidget {
  final String qrCode;  // The QR code result passed from the scanner

  const QrCodeDisplay({Key? key, required this.qrCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
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
              const SizedBox(height: 10),
              const Text(
                'Valid Ticket',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Purchase Information',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              const Text(
                'Ticket Number',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 5),
              Text(
                qrCode, // Display the scanned QR code as Ticket Number
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Column(
                    children: [
                      Text('Normal Tickets', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('0', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('VIP Tickets', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('2', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  Column(
                    children: [
                      Text('VVIP Tickets', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 5),
                      Text('0', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Total Number of Scanned: 2',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Show the popup dialog with input fields
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return _TicketCountDialog();
                        },
                      );
                    },
                    child: const Text('Scanned Ticket Count'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the NextPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextPage(),
                        ),
                      );
                    },
                    child: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Popup dialog for entering ticket counts
class _TicketCountDialog extends StatelessWidget {
  final TextEditingController normalTicketsController = TextEditingController();
  final TextEditingController vipTicketsController = TextEditingController();
  final TextEditingController vvipTicketsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.confirmation_number, size: 32, color: Colors.blueAccent),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pop();  // Close the dialog
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Text(
              'Please Enter the Scanned Normal Tickets',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: normalTicketsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please Enter the Scanned VIP Tickets',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: vipTicketsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please Enter the Scanned VVIP Tickets',
              style: TextStyle(fontSize: 16),
            ),
            TextField(
              controller: vvipTicketsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // You can retrieve the entered values here and handle them
                String normalTickets = normalTicketsController.text;
                String vipTickets = vipTicketsController.text;
                String vvipTickets = vvipTicketsController.text;

                // Handle the values as needed

                // Close the dialog
                Navigator.of(context).pop();
              },
              child: const Text('Done'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
