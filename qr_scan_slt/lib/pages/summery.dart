import 'package:flutter/material.dart';

class Summery extends StatelessWidget {
  const Summery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Summery'),backgroundColor: Colors.blue,),
      body: const Center(
        child: Text("Summery Page"),
      ),
    );
  }
}
