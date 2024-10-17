import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_scan_slt/pages/qr_code_display.dart'; // Correct path
import 'package:qr_scan_slt/pages/details.dart'; // Import the Details page
import 'package:qr_scan_slt/pages/summery.dart'; // Import the Summery page

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1; // Start with the QR Scanner as the selected index
  bool isTorchOn = false; // For torch toggle

  MobileScannerController cameraController = MobileScannerController();

  List<Widget> _pages = []; // Pages will be initialized in initState

  @override
  void initState() {
    super.initState();

    _pages = [
      buildHistoryPage(), // History page
      buildQrScanPage(),  // QR Scanner page
      Summery(),          // Summery page loaded here
    ];
  }

  // Function to build the QR Scan page
  Widget buildQrScanPage() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  child: MobileScanner(
                    controller: cameraController,
                    onDetect: (barcodeCapture) {
                      final String? qrCode = barcodeCapture.barcodes.first.rawValue;
                      if (qrCode != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QrCodeDisplay(qrCode: qrCode),
                          ),
                        );
                      }
                    },
                  ),
                ),
                Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent, width: 3),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.4),
                        spreadRadius: 5,
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Scan QR Code',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10.0, right: 16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                backgroundColor: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    isTorchOn = !isTorchOn;
                    cameraController.toggleTorch();
                  });
                },
                child: Icon(
                  isTorchOn ? Icons.flash_on : Icons.flash_off,
                  size: 28,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build the History page
  Widget buildHistoryPage() {
    return Details(qrCode: 'Sample QR Code'); // Provide a sample QR code
  }

  // Method to handle navigation bar item click
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Show the selected page
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight: Radius.circular(0),
            ),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                selectedFontSize: 12,
                unselectedFontSize: 12,
                selectedItemColor: Colors.blueAccent,
                unselectedItemColor: Colors.white.withOpacity(0.8),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: 'History',
                  ),
                  BottomNavigationBarItem(
                    icon: SizedBox.shrink(),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.summarize),
                    label: 'Summary',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 15,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.qr_code_scanner, size: 30, color: Colors.white),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
