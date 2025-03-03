import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Userpage extends StatefulWidget {
  const Userpage({super.key});

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  final user = FirebaseAuth.instance.currentUser;

  // Función para cerrar sesión
  void signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Perfil de Usuario',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[800],
        centerTitle: true,
      ),
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Tarjeta de información del usuario
              Card(
                margin: const EdgeInsets.all(16.0),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Foto de perfil (si está disponible)
                      if (user?.photoURL != null)
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(user!.photoURL!),
                        )
                      else
                        Icon(Icons.person, size: 80, color: Colors.red[800]),
                      const SizedBox(height: 16),
                      // Nombre del usuario (si está disponible)
                      if (user?.displayName != null)
                        Text(
                          user!.displayName!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      const SizedBox(height: 8),
                      // Correo electrónico
                      Text(
                        user?.email ?? "No hay correo electrónico",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Botón de cerrar sesión
                      ElevatedButton.icon(
                        onPressed: signOut,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[800],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        icon: const Icon(Icons.logout, color: Colors.white),
                        label: const Text(
                          "Cerrar Sesión",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
