import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Avisos.dart';
import 'JEE.dart';
import 'Kits.dart';
import 'Workshops.dart';
import 'qr.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String logoCurso = "assets/images/logo_w.png";

  void GotoQrReader() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QrPage()),
    );
  }

  void GoToJEE() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const JEEPage()),
    );
  }

  void GoToAvisos() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AvisosPage()),
    );
  }

  void GoToWorkshops() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WorkshopsPage()),
    );
  }

  void GoToKits() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KitsPage()),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: GotoQrReader, icon: const Icon(Icons.qr_code_scanner)),
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
                'NEEEICUM',
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
      body: const Center(),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: Colors.grey[800],
          child: IconTheme(
              data:
                  IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
              child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: GoToWorkshops,
                          icon: const Icon(Icons.construction_outlined)),
                      IconButton(
                          onPressed: GoToAvisos,
                          icon: const Icon(Icons.warning_amber_outlined)),
                      const SizedBox(width: 24),
                      IconButton(
                          onPressed: GoToKits,
                          icon: const Icon(Icons.business_center_rounded)),
                      IconButton(
                          onPressed: GoToJEE,
                          icon: const Icon(Icons.electric_bolt_outlined)),
                    ],
                  )))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: const IconThemeData(size: 25.0),
        curve: Curves.bounceIn,
        overlayColor: Colors.transparent,
        tooltip: 'Speed dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 5.0,
        shape: const CircleBorder(),
        children: [
          SpeedDialChild(
              child: const Icon(Icons.construction_outlined),
              backgroundColor: Colors.indigo,
              elevation: 5.0,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        scrollable: true,
                        title: const Text('Workshop'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.construction_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Info',
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.warning_amber_outlined),
              backgroundColor: Colors.indigo,
              elevation: 5.0,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        scrollable: true,
                        title: const Text('Aviso'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.warning_amber_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Info',
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.business_center_rounded),
              backgroundColor: Colors.indigo,
              elevation: 5.0,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        scrollable: true,
                        title: const Text('Kit'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.business_center_rounded),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Info',
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.electric_bolt_outlined),
              backgroundColor: Colors.indigo,
              elevation: 5.0,
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        scrollable: true,
                        title: const Text('Evento'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.electric_bolt_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'Info',
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //adicionar botao
                      );
                    });
              }),
        ],
      ),
    );
  }
}
