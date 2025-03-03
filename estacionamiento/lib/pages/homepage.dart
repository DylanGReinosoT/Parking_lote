import 'package:estacionamiento/pages/parkingpage.dart';
import 'package:estacionamiento/pages/userpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0; // Índice para controlar la página actual

  // Lista de páginas para navegar
  final List<Widget> _pages = [
    const WelcomeMessage(), // Mensaje de bienvenida
    const Userpage(), // Página de información del usuario
    const ParkingPage(), // Página del mapa de estacionamiento
  ];

  // Función para cambiar de página
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
          'Inicio',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[800],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Usuario',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: 'Estacionamiento',
          ),
        ],
      ),
    );
  }
}

// Mensaje de bienvenida
class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '¡Bienvenido!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}
