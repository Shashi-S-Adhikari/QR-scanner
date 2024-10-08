import 'package:flutter/material.dart';

class ScannedTicketCount extends StatelessWidget {
  const ScannedTicketCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scanned Ticket Count'),
      ),
      body: const Center(
        child: Text(
          'Scanned Ticket Count Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
