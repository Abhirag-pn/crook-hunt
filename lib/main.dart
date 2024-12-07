
import 'package:crookhunt/ui/pages/intropage.dart';
import 'package:crookhunt/ui/pages/pageresolver.dart';
import 'package:crookhunt/ui/pages/registerpage.dart';
import 'package:crookhunt/utils/shared_pref_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefService.init();
  await Firebase.initializeApp();
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
      home: PageResolver()
    );
  }
}

