import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:neeicum/HomePage/home.dart';
import 'package:neeicum/auth/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'NEEEICUM Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
          backgroundColor: Colors.grey[900]),
      home: const HomePage(),
    );
  }
}
