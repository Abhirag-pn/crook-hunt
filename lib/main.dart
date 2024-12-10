import 'package:crookhunt/ui/pages/Level5/answer5.dart';
import 'package:crookhunt/ui/pages/Level5/level5.dart';
import 'package:crookhunt/ui/pages/level0/Answer0.dart';
import 'package:crookhunt/ui/pages/level1/answer1.dart';
import 'package:crookhunt/ui/pages/level1/reveal1.dart';
import 'package:crookhunt/ui/pages/level1/level1.dart';
import 'package:crookhunt/ui/pages/level2/answer2.dart';
import 'package:crookhunt/ui/pages/level2/level2.dart';
import 'package:crookhunt/ui/pages/level3/answer3.dart';
import 'package:crookhunt/ui/pages/level3/level3.dart';
import 'package:crookhunt/ui/pages/level4/level4.dart';
import 'package:crookhunt/ui/pages/level6/answer6.dart';
import 'package:crookhunt/ui/pages/level6/level6.dart';
import 'package:crookhunt/ui/pages/pageresolver.dart';
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
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.brown.shade800

          ),
          fontFamily: 'Henny',
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff2F1700)),
          useMaterial3: true,
        ),
        home: const PageResolver());
  }
}
