
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'qr_code_display.dart'; // Import the QrCodeDisplay page

class QrScan extends StatefulWidget {
  const QrScan({Key? key}) : super(key: key);

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  String? result;  // Stores the scanned QR code result
  MobileScannerController cameraController = MobileScannerController();  // Controller for MobileScanner
  bool isTorchOn = false;  // Keep track of torch state

  @override
  void initState() {
    super.initState();
    requestCameraPermission();  // Request camera permission in initState
  }

  // Function to request camera permission
  Future<void> requestCameraPermission() async {
    var status = await Permission.camera.status;
    if (!status.isGranted) {
      // If the permission is not granted, request it
      var result = await Permission.camera.request();
      if (result.isDenied || result.isPermanentlyDenied) {
        // Handle the scenario when permission is permanently denied
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Camera permission is required to scan QR codes')),
        );
      }
    }
  }

  // Pause or resume camera based on platform
  @override
  void reassemble() {
    super.reassemble();
    if (cameraController.isStarting) {
      cameraController.stop();
    } else {
      cameraController.start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),  // Optional app bar
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: cameraController,
              onDetect: (barcodeCapture) {
                // Get the first barcode's raw value
                final String? qrCode = barcodeCapture.barcodes.first.rawValue;
                if (qrCode != null) {
                  // Navigate to QrCodeDisplay page and pass the QR code result
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
          Expanded(
            flex: 1,
            child: Center(
              child: const Text('Scan a QR code'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isTorchOn ? Icons.flash_on : Icons.flash_off,
        ),
        onPressed: () {
          // Toggle the torch state
          setState(() {
            isTorchOn = !isTorchOn;
            cameraController.toggleTorch();
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();  // Clean up the camera controller
    super.dispose();
  }
}




// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'details.dart'; // Import the Details page
//
// class QrScan extends StatefulWidget {
//   const QrScan({Key? key}) : super(key: key);
//
//   @override
//   State<QrScan> createState() => _QrScanState();
// }
//
// class _QrScanState extends State<QrScan> {
//   String? result;  // Stores the scanned QR code result
//   MobileScannerController cameraController = MobileScannerController();  // Controller for MobileScanner
//   bool isTorchOn = false;  // Keep track of torch state
//
//   @override
//   void initState() {
//     super.initState();
//     requestCameraPermission();  // Request camera permission in initState
//   }
//
//   // Function to request camera permission
//   Future<void> requestCameraPermission() async {
//     var status = await Permission.camera.status;
//     if (!status.isGranted) {
//       // If the permission is not granted, request it
//       var result = await Permission.camera.request();
//       if (result.isDenied || result.isPermanentlyDenied) {
//         // Handle the scenario when permission is permanently denied
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Camera permission is required to scan QR codes')),
//         );
//       }
//     }
//   }
//
//   // Pause or resume camera based on platform
//   @override
//   void reassemble() {
//     super.reassemble();
//     if (cameraController.isStarting) {
//       cameraController.stop();
//     } else {
//       cameraController.start();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('QR Code Scanner')),  // Optional app bar
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 5,
//             child: MobileScanner(
//               controller: cameraController,
//               onDetect: (barcodeCapture) {
//                 // Get the first barcode's raw value
//                 final String? qrCode = barcodeCapture.barcodes.first.rawValue;
//                 if (qrCode != null) {
//                   // Navigate to Details page and pass the QR code result
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Details(qrCode: qrCode),
//                     ),
//                   );
//                 }
//               },
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: const Center(
//               child: Text('Scan a QR code'),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           isTorchOn ? Icons.flash_on : Icons.flash_off,
//         ),
//         onPressed: () {
//           // Toggle the torch state
//           setState(() {
//             isTorchOn = !isTorchOn;
//             cameraController.toggleTorch();
//           });
//         },
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     cameraController.dispose();  // Clean up the camera controller
//     super.dispose();
//   }
// }
//
//
//
//
//
//
