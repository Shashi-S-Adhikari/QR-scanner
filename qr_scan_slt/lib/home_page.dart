import 'package:flutter/material.dart';
import 'package:qr_scan_slt/pages/details.dart';
import 'package:qr_scan_slt/pages/qr_scan.dart';
import 'package:qr_scan_slt/pages/summery.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  //this keeps track of the current page
  int _selectedIndex = 0;

  //update new selected index
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //create list of pages
  final List<Widget> _pages = [
    //Details
    const Details(qrCode: '',),

    // QR SCAN
    const QrScan(),

    //Summery
    const Summery(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          //Details
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Details",
          ),

          //QR Scan
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: "QR Scan",
          ),

          //Summery
          BottomNavigationBarItem(
            icon: Icon(Icons.summarize),
            label: "Summery",
          ),
        ],
      ),
    );
  }
}
