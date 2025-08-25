import 'package:first_app/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart' hide HomeScreen;
import 'profile_screen.dart' as profile;

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    const Center(child: Text("Publish")), // temporary placeholder
    const Center(child: Text("Your Rides")), // temporary placeholder
    const Center(child: Text("Inbox")), // temporary placeholder
    profile.ProfileScreen(
      user: null,
      networkAvailable: false,
    ), // <-- profile page here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Publish",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Your Rides",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Inbox",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
