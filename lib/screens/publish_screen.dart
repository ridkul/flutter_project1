// TODO Implement this library.
import 'package:flutter/material.dart';

class PublishScreen extends StatelessWidget {
  const PublishScreen({super.key});   // ✅ add const constructor

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Publish Screen',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
