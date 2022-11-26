import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr_flutter/qr_flutter.dart';

class KitsPage extends StatefulWidget {
  const KitsPage({super.key});

  @override
  State<KitsPage> createState() => _KitsPageState();
}

class _KitsPageState extends State<KitsPage> {
  String logoCurso = "assets/images/logo_w.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null, icon: const Icon(Icons.business_center_rounded)),
        ],
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Icon(Icons.business_center_rounded, size: 30),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Kits',
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
