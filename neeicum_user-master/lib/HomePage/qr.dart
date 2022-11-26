import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String logoCurso = "assets/images/logo_w.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(onPressed: null, icon: const Icon(Icons.qr_code_scanner)),
        ],
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Image.asset(
                logoCurso,
                scale: 50,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Qr',
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
