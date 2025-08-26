import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PublishPage extends StatefulWidget {
  const PublishPage({super.key});

  @override
  State<PublishPage> createState() => _PublishPageState();
}

class _PublishPageState extends State<PublishPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController seatsController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  bool isLoading = false;

  Future<void> publishRide() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    final rideData = {
      "from": fromController.text,
      "to": toController.text,
      "date": dateController.text,
      "time": timeController.text,
      "seats": int.tryParse(seatsController.text) ?? 1,
      "price": double.tryParse(priceController.text) ?? 0,
    };

    try {
      // 🔗 replace with correct API base URL (10.0.2.2 if emulator)
      final response = await http.post(
        Uri.parse("http://10.0.2.2:4000/api/searches"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(rideData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Ride Published Successfully ✅")),
        );

        fromController.clear();
        toController.clear();
        dateController.clear();
        timeController.clear();
        seatsController.clear();
        priceController.clear();
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed: ${response.body}")),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Publish Ride")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: fromController,
                decoration: const InputDecoration(
                  labelText: "Leaving From",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter leaving place" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: toController,
                decoration: const InputDecoration(
                  labelText: "Going To",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter destination" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: dateController,
                decoration: const InputDecoration(
                  labelText: "Date (YYYY-MM-DD)",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter date" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                  labelText: "Time (HH:MM)",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter time" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: seatsController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Available Seats",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter seats" : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Price",
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v == null || v.isEmpty ? "Enter price" : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: isLoading ? null : publishRide,
                icon: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 2)
                    : const Icon(Icons.check),
                label: Text(isLoading ? "Publishing..." : "Publish Ride"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
