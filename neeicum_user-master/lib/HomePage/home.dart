import 'package:flutter/material.dart';
import 'Avisos.dart';
import 'JEE.dart';
import 'Kits.dart';
import 'Workshops.dart';
import 'qrMain.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "", data = "", info = "";
  String logoCurso = "assets/images/logo_w.png";
  TextEditingController _name = new TextEditingController();
  TextEditingController _data = new TextEditingController();
  TextEditingController _info = new TextEditingController();

  void GotoQrReader() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QrPage()),
    );
  }

  int _currentIndex = 0;

  PageController _pageController = PageController(initialPage: 0);

  final _bottomNavigationBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.construction_outlined,
        color: Colors.white,
      ),
      label: 'Workshops',
    ),
    const BottomNavigationBarItem(
        icon: Icon(Icons.warning_amber_outlined, color: Colors.white),
        label: 'Avisos'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.business_center_rounded, color: Colors.white),
        label: 'Kits'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.bolt_rounded, color: Colors.white), label: 'JEE')
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
          WorkshopsPage(name: name, data: data, info: info),
          AvisosPage(),
          KitsPage(),
          JEEPage(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.white,
        items: _bottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease);
          });
        },
      ),
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
                                  controller: _name,
                                  decoration: const InputDecoration(
                                    labelText: 'Nome',
                                    icon: Icon(Icons.construction_outlined),
                                  ),
                                ),
                                TextFormField(
                                  controller: _data,
                                  decoration: const InputDecoration(
                                    labelText: 'Data',
                                    icon: Icon(Icons.calendar_month),
                                  ),
                                ),
                                TextFormField(
                                  controller: _info,
                                  decoration: const InputDecoration(
                                    labelText: 'Info',
                                    icon: Icon(Icons.info),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => WorkshopsPage(
                                      name: _name.text,
                                      data: _data.text,
                                      info: _info.text)));
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          )
                        ],
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
                        actions: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            onPressed: () {
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AvisosPage(
                                      name: _name.text,
                                      data: _data.text,
                                      info: _info.text)));*/
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          )
                        ],
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
                        actions: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            onPressed: () {
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => KitsPage(
                                      name: _name.text,
                                      data: _data.text,
                                      info: _info.text)));*/
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          )
                        ],
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.bolt_rounded),
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
                                    icon: Icon(Icons.bolt_rounded),
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
                        actions: <Widget>[
                          FloatingActionButton(
                            backgroundColor: Colors.indigo,
                            onPressed: () {
                              /*Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => JEEPage(
                                      name: _name.text,
                                      data: _data.text,
                                      info: _info.text)));*/
                            },
                            child: const Icon(Icons.arrow_forward_ios,
                                color: Colors.white),
                          )
                        ],
                      );
                    });
              }),
          SpeedDialChild(
              child: const Icon(Icons.qr_code_scanner_rounded),
              backgroundColor: Colors.indigo,
              elevation: 5.0,
              onTap: () {
                GotoQrReader();
              })
        ],
      ),
    );
  }
}
