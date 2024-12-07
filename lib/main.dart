import 'package:crookhunt/ui/pages/pageresolver.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crook Hunt',
      theme: ThemeData(
        
        fontFamily: 'Henny',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2F1700)),
        useMaterial3: true,
      ),
      home: const PageResolver()
    );
  }
}

