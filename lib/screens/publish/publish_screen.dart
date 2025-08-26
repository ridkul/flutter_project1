import 'package:flutter/material.dart';


class PublishMainScreen extends StatelessWidget {
  const PublishMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Publish Ride"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // later you can navigate to ride creation page
          },
          child: const Text("Create a Ride"),
        ),
      ),
    );
  }
}
