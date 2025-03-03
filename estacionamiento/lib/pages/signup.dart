import 'package:estacionamiento/wapper.dart'; // Asegúrate de que la ruta sea correcta
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  // Función para registrar al usuario
  void signup() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      // Navegar a la página principal después del registro exitoso
      Get.offAll(const Wapper());
    } on FirebaseAuthException catch (e) {
      // Mostrar un mensaje de error si el registro falla
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Error al registrar"),
          backgroundColor: Colors.red[800],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8, // Sombra
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título
                    Text(
                      "Registro",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo de correo electrónico
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: "Correo electrónico",
                        labelStyle: TextStyle(color: Colors.red[800]),
                        prefixIcon: Icon(Icons.email, color: Colors.red[800]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[800]!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Campo de contraseña
                    TextField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Contraseña",
                        labelStyle: TextStyle(color: Colors.red[800]),
                        prefixIcon: Icon(Icons.lock, color: Colors.red[800]),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red[800]!),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Botón de registro
                    ElevatedButton(
                      onPressed: signup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Registrarse",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Enlace para ir a la página de inicio de sesión
                    TextButton(
                      onPressed: () {
                        // Navegar a la página de inicio de sesión
                        Get.back(); // O usar Get.to(() => LoginPage()) si tienes una página de login
                      },
                      child: Text(
                        "¿Ya tienes una cuenta? Inicia sesión",
                        style: TextStyle(
                          color: Colors.red[800],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
