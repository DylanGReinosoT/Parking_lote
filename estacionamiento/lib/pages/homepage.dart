import 'package:estacionamiento/pages/parkingpage.dart';
import 'package:estacionamiento/pages/userpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const ParkingPage(),
    const Userpage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Parking Lot',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[800],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 10,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.red[800],
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(_selectedIndex == 0 ? 8 : 4),
                decoration: BoxDecoration(
                  color: _selectedIndex == 0
                      ? Colors.red[800]
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.local_parking,
                  color: _selectedIndex == 0 ? Colors.white : Colors.grey,
                ),
              ),
              label: 'Estacionamiento',
            ),
            BottomNavigationBarItem(
              icon: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.all(_selectedIndex == 1 ? 8 : 4),
                decoration: BoxDecoration(
                  color: _selectedIndex == 1
                      ? Colors.red[800]
                      : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: _selectedIndex == 1 ? Colors.white : Colors.grey,
                ),
              ),
              label: 'Usuario',
            )
          ],
        ),
      ),
    );
  }
}
