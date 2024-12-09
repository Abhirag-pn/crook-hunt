import 'package:crookhunt/ui/pages/level1/level1.dart';
import 'package:crookhunt/ui/pages/paper.dart';
import 'package:crookhunt/ui/pages/loadingpage.dart';
import 'package:crookhunt/ui/pages/pageresolver.dart';
import 'package:crookhunt/ui/pages/pagetest.dart';
import 'package:crookhunt/ui/pages/registerpage.dart';
import 'package:crookhunt/ui/pages/rulespage.dart';
import 'package:crookhunt/utils/shared_pref_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await SharedPrefService.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crook Hunt',
        theme: ThemeData(
          fontFamily: 'Henny',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2F1700)),
          useMaterial3: true,
        ),
        home: Level1());
  }
}
