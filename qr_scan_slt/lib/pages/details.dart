import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String qrCode; // Receives the scanned QR code
  const Details({Key? key, required this.qrCode}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // To keep track of selected tab
  bool isHistorySelected = true;

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
      body: Column(
        children: [
          // Tab switcher between History and Summary
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // History Tab
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHistorySelected = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: isHistorySelected ? Colors.blueAccent : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'History',
                      style: TextStyle(
                        color: isHistorySelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Summary Tab
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isHistorySelected = false;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    decoration: BoxDecoration(
                      color: !isHistorySelected ? Colors.blueAccent : Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Summary',
                      style: TextStyle(
                        color: !isHistorySelected ? Colors.white : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Display scanned QR code result or some summary
          Expanded(
            child: Center(
              child: isHistorySelected
                  ? Text(
                'Scanned QR Code: ${widget.qrCode}',  // Display the QR code result
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              )
                  : const Text(
                'Summary will be displayed here',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
