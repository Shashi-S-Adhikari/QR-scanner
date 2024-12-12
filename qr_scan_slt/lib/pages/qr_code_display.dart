import 'package:flutter/material.dart';
import 'package:qr_scan_slt/dbHelper/mongodb.dart';

class QrCodeDisplay extends StatefulWidget {
  final String qrCode;

  const QrCodeDisplay({Key? key, required this.qrCode}) : super(key: key);

  @override
  _QrCodeDisplayState createState() => _QrCodeDisplayState();
}

class _QrCodeDisplayState extends State<QrCodeDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents resizing when the keyboard appears
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Ticket Information'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Event title box with decorative styling
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: const Text(
                'Deep Jungle Reggae Stage\n2024',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Card to display ticket information in a more creative style
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blueAccent.withOpacity(0.2), Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 12,
                    spreadRadius: 2,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Valid Ticket',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.qr_code_2, color: Colors.blueAccent, size: 28),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          widget.qrCode, // Display the scanned QR code as Ticket Number
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildTicketInfo('Normal Tickets', '0', Icons.event_seat),
                      _buildTicketInfo('VIP Tickets', '2', Icons.star),
                      _buildTicketInfo('VVIP Tickets', '0', Icons.vpn_key),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Divider(color: Colors.blueAccent),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.confirmation_number, color: Colors.blueAccent),
                      SizedBox(width: 5),
                      Text(
                        'Total Number of Scanned: 2',
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Button to show ticket count input dialog
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _TicketCountDialog(qrCode: widget.qrCode);
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
          ],
        ),
      ),
    );
  }

  // Helper method to build ticket info sections
  Widget _buildTicketInfo(String title, String count, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blueAccent, size: 32),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        const SizedBox(height: 5),
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

// Updated dialog with `SingleChildScrollView` to prevent overflow
class _TicketCountDialog extends StatelessWidget {
  final TextEditingController normalTicketsController = TextEditingController();
  final TextEditingController vipTicketsController = TextEditingController();
  final TextEditingController vvipTicketsController = TextEditingController();
  final String qrCode;

  _TicketCountDialog({required this.qrCode});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Scanned Ticket Count',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 20),
              _buildInputField('Normal Tickets', normalTicketsController),
              const SizedBox(height: 15),
              _buildInputField('VIP Tickets', vipTicketsController),
              const SizedBox(height: 15),
              _buildInputField('VVIP Tickets', vvipTicketsController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Retrieve values and save to MongoDB
                  int normalTickets = int.tryParse(normalTicketsController.text) ?? 0;
                  int vipTickets = int.tryParse(vipTicketsController.text) ?? 0;
                  int vvipTickets = int.tryParse(vvipTicketsController.text) ?? 0;

                  // Prepare data to insert
                  var ticketData = {
                    'ticket_number': qrCode,
                    'normal_tickets': normalTickets,
                    'vip_tickets': vipTickets,
                    'vvip_tickets': vvipTickets,
                    'timestamp': DateTime.now().toString(),
                  };

                  // Insert data to MongoDB
                  await MongoDatabase.addTicketData(ticketData);

                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text('Done'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Creates each ticket type input field with consistent styling
  Widget _buildInputField(String label, TextEditingController controller) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.event_seat, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyle(color: Colors.blueAccent),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
