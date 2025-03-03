import 'package:estacionamiento/pages/homepage.dart';
import 'package:estacionamiento/pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wapper extends StatefulWidget {
  const Wapper({super.key});

  @override
  State<Wapper> createState() => _WapperState();
}

class _WapperState extends State<Wapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Homepage();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
