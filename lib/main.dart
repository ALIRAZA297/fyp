import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCHQ5NIauBA2zWh2p0_FtbE7xcdUUjvShc",
      appId: "1:429524941554:android:6f9c600a7b7c9fe1b62e6b",
      messagingSenderId: "429524941554",
      projectId: "final-9577b",
    ),
  );
  runApp(const MaidConnectApp());
}

class MaidConnectApp extends StatelessWidget {
  const MaidConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaidConnect app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
