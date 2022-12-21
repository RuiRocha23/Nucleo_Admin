import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qr_flutter/qr_flutter.dart';

class WorkshopsPage extends StatefulWidget {
  String name, data, info;
  WorkshopsPage(
      {required this.name, required this.data, required this.info, super.key});

  @override
  State<WorkshopsPage> createState() => _WorkshopsPageState(name, data, info);
}

class _WorkshopsPageState extends State<WorkshopsPage> {
  String name, data, info;
  _WorkshopsPageState(this.name, this.data, this.info);
  String logoCurso = "assets/images/logo_w.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: null, icon: const Icon(Icons.construction_outlined)),
        ],
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: [
              Icon(Icons.construction_outlined, size: 30),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Workshops',
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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Nome: ${name}'),
          Text('Data: ${data}'),
          Text('Info: ${info}')
        ],
      )),
    );
  }
}
