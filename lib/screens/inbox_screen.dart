// TODO Implement this library.
import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});   // ✅ add const constructor

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Inbox Screen',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
