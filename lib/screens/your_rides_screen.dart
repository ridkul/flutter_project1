import 'package:flutter/material.dart';
import 'publish/publish_screen.dart';  // add this import at the top


class YourRidesScreen extends StatelessWidget {
  const YourRidesScreen({super.key});   // ✅ add const constructor

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Your Rides Screen',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

