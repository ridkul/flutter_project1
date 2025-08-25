// ignore: unused_element
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required user, required bool networkAvailable});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "About you",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            Text(
              "Account",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            ListTile(
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              title: const Text("Sanskruti",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: const Text("Newcomer"),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),

            // Complete profile card
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Complete your profile",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text(
                      "This helps builds trust, encouraging members to travel with you.\n0 out of 6 complete"),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: 0,
                    color: Colors.teal,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: const Text("Add profile picture",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            const Divider(),
            ListTile(
              title: const Text("Edit personal details",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
              onTap: () {},
            ),
            const Divider(),

            // Verify Profile
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Verify your profile",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
              title: const Text("Verify your Govt. ID"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
              title: const Text("Confirm email saeedeshpande14@gmail.com"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
              title: const Text("Confirm phone number +918080388993"),
              onTap: () {},
            ),

            const Divider(),

            // Carpool reliability
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Your carpooling reliability",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),
            const ListTile(
              leading: Icon(Icons.chat_bubble_outline, color: Colors.green),
              title: Text("Never cancels bookings as a passenger"),
            ),

            const Divider(),

            // About You section
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("About you",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
              title: const Text("Add a mini bio"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.add_circle_outline, color: Colors.blue),
              title: const Text("Edit travel preferences"),
              onTap: () {},
            ),

            const SizedBox(height: 20),
            Container(
              color: Colors.red,
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Network unavailable at this time",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(Icons.close, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
