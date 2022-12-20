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

  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: const Icon(Icons.construction_outlined, color: Colors.white),
      label: 'Workshops',
    ),
    BottomNavigationBarItem(
        icon: const Icon(Icons.warning_amber_outlined, color: Colors.white),
        label: 'Avisos'),
    BottomNavigationBarItem(
        icon: const Icon(Icons.business_center_rounded, color: Colors.white),
        label: 'Kits'),
    BottomNavigationBarItem(
        icon: const Icon(Icons.electric_bolt_outlined, color: Colors.white),
        label: 'JEE')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: PageView(
        controller: _pageController,
        onPageChanged: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        children: [
          WorkshopsPage(),
          AvisosPage(),
          KitsPage(),
          JEEPage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        iconTheme: IconThemeData(size: 25.0),
        curve: Curves.bounceIn,
        overlayColor: Colors.transparent,
        tooltip: 'Speed dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 5.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
              child: Icon(Icons.construction_outlined),
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
                        title: Text('Workshop'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.construction_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
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
              child: Icon(Icons.warning_amber_outlined),
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
                        title: Text('Aviso'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.warning_amber_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
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
              child: Icon(Icons.business_center_rounded),
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
                        title: Text('Kit'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.business_center_rounded),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
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
              child: Icon(Icons.electric_bolt_outlined),
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
                        title: Text('Evento'),
                        content: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.electric_bolt_outlined),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
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
