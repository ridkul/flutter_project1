import 'package:flutter/material.dart';
import 'package:first_app/screens/search_screen.dart';
import 'home_screen.dart' hide HomeScreen;
import 'profile_screen.dart';

class YourRidesScreen extends StatefulWidget {
  const YourRidesScreen({super.key});

  @override
  State<YourRidesScreen> createState() => _YourRidesScreenState();
}

class _YourRidesScreenState extends State<YourRidesScreen> {
  int _currentIndex = 2;

  // Example dummy user (replace later with actual user data)
  final someUser = {"name": "Guest User", "email": "guest@example.com"};

  List<Widget> get _screens => [
    HomeScreen(),
    const Center(child: Text('Publish', style: TextStyle(fontSize: 22))),
    _yourRidesContent(),
    const Center(child: Text('Inbox', style: TextStyle(fontSize: 22))),
    ProfileScreen(user: someUser, networkAvailable: true),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  static Widget _yourRidesContent() {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Center(
            child: Image.asset(
              'assets/undraw_travel.png',
              width: 220,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Your future travel plans will appear here.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal[900],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Find the perfect ride from thousands of destinations, "
              "or publish to share your travel costs.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Publish',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Your rides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
