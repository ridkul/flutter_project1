// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController leavingFromController = TextEditingController();
  final TextEditingController goingToController = TextEditingController();
  DateTime? selectedDate;
  int passengers = 1;

  Future<void> _pickDate() async {
    DateTime today = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: today,
      lastDate: DateTime(today.year + 2),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  void _searchRides() {
    // ignore: duplicate_ignore
    // ignore: avoid_print
    print("Leaving From: ${leavingFromController.text}");
    // ignore: avoid_print
    print("Going To: ${goingToController.text}");
    print("Date: ${selectedDate != null ? selectedDate.toString().split(' ')[0] : 'Not Selected'}");
    print("Passengers: $passengers");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Searching rides...")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/search_screen.png"), // <-- your banner image
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable form
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 60),

                // Title text on top of image
                const Center(
                  child: Text(
                    "Your pick of rides at low prices",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 3,
                          color: Colors.black45,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                const SizedBox(height: 180),

                // Card box overlaps the image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Leaving From
                          TextField(
                            controller: leavingFromController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.circle_outlined, color: Colors.blueAccent),
                              hintText: "Leaving from",
                              border: InputBorder.none,
                            ),
                          ),
                          const Divider(),

                          // Going To
                          TextField(
                            controller: goingToController,
                            decoration: const InputDecoration(
                              icon: Icon(Icons.radio_button_unchecked, color: Colors.blueAccent),
                              hintText: "Going to",
                              border: InputBorder.none,
                            ),
                          ),
                          const Divider(),

                          // Date Picker
                          ListTile(
                            leading: const Icon(Icons.calendar_today, color: Colors.blueAccent),
                            title: Text(
                              selectedDate != null
                                  ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                  : "Select Date",
                            ),
                            onTap: _pickDate,
                          ),
                          const Divider(),

                          // Passenger Selector
                          Row(
                            children: [
                              const Icon(Icons.person_outline, color: Colors.blueAccent),
                              const SizedBox(width: 12),
                              IconButton(
                                onPressed: () {
                                  if (passengers > 1) {
                                    setState(() {
                                      passengers--;
                                    });
                                  }
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                              Text(
                                "$passengers",
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    passengers++;
                                  });
                                },
                                icon: const Icon(Icons.add_circle_outline),
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // Search Button
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _searchRides,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(vertical: 14),
                              ),
                              child: const Text(
                                "Search",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
