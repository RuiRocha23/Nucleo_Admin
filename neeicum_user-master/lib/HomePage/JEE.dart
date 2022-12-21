import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr_flutter/qr_flutter.dart';

class JEEPage extends StatefulWidget {
  const JEEPage({super.key});

  @override
  State<JEEPage> createState() => _JEEPageState();
}

class _JEEPageState extends State<JEEPage> {
  String logoCurso = "assets/images/logo_w.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: null, icon: const Icon(Icons.bolt_rounded)),
        ],
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Icon(Icons.bolt_rounded, size: 30),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'JEE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        //backgroundColor: Colors.indigo,
      ),
    );
  }
}
