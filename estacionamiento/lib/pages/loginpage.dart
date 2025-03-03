import 'package:estacionamiento/pages/forgotpage.dart';
import 'package:estacionamiento/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Para la autenticación con Google

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;

  // Función para iniciar sesión con Google
  Future<void> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return; // El usuario canceló el inicio de sesión

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Error al iniciar sesión con Google: ${e.toString()}")),
      );
    }
  }

  // Función para iniciar sesión con correo y contraseña
  void signIn() async {
    setState(() => isLoading = true);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(252, 252, 252, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white, // Fondo blanco para el formulario
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/Logo.png", // Ruta de la imagen
                    height: 120, // Ajusta el tamaño según necesites
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Iniciar Sesión",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Campo de correo electrónico
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Correo Electrónico",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email, color: Colors.red[700]),
                    ),
                  ),
                  const SizedBox(height: 15),
                  // Campo de contraseña
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.red[700]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botón de iniciar sesión con correo y contraseña
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : signIn,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[800],
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text(
                              "Iniciar Sesión",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Botón de registro
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // Navegar a la página de registro
                        Get.to(() => const Signup());
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.red[800]!),
                      ),
                      child: Text(
                        "Registrarse",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red[800],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Botón de recuperar contraseña
                  TextButton(
                    onPressed: () {
                      // Navegar a la página de recuperación de contraseña
                      Get.to(() => const Forgotpage());
                    },
                    child: Text(
                      "¿Olvidaste tu contraseña?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Texto "O inicia sesión con"
                  Text(
                    "O inicia sesión con",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Botón de inicio de sesión con Google
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: loginWithGoogle,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: BorderSide(color: Colors.red[800]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/google_logo.png", // Ruta del logo de Google
                            height: 24,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Iniciar sesión con Google",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.red[800],
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
        ),
      ),
    );
  }
}
