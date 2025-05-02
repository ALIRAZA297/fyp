import 'package:flutter/material.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MaidConnectApp());
}

class MaidConnectApp extends StatelessWidget {
  const MaidConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MaidConnect',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
