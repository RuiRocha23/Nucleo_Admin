import 'dart:async';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class QrPage extends StatefulWidget {
  const QrPage({super.key});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  String logoCurso = "assets/images/logo_w.png";

  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? barcode;

  @override
  Widget build(BuildContext context) {
    controller?.resumeCamera();
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () async {
                  await controller?.resumeCamera();
                },
                icon: const Icon(Icons.qr_code_scanner_rounded)),
            const SizedBox(width: 10),
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
        ),
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            buildQrView(context),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () {
                  controller?.toggleFlash();
                },
                child: const Icon(
                  Icons.flash_on_rounded,
                  color: Colors.white,
                ),
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                backgroundColor: Colors.indigo,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => buildResult(context));
                },
                child: const Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ));
  }

  Widget buildResult(BuildContext context) {
    if (barcode != null) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${barcode!.code}', //mostrar info do qr scaneado
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
        actions: <Widget>[
          SpeedDial(
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
            direction: SpeedDialDirection.left,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.money_off_rounded),
                backgroundColor: Colors.indigo,
                elevation: 0.5,
                onTap: () {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.attach_money_rounded),
                backgroundColor: Colors.indigo,
                elevation: 0.5,
                onTap: () {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.bolt_rounded),
                backgroundColor: Colors.indigo,
                elevation: 0.5,
                onTap: () {},
              ),
              SpeedDialChild(
                child: const Icon(Icons.construction_rounded),
                backgroundColor: Colors.indigo,
                elevation: 0.5,
                onTap: () {},
              ),
            ],
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.indigo,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream
        .listen((barcode) => setState(() => this.barcode = barcode));
  }
}
