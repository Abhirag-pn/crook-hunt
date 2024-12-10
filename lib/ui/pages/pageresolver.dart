import 'dart:developer';

import 'package:crookhunt/ui/pages/Level5/level5.dart';
import 'package:crookhunt/ui/pages/level0/Answer0.dart';
import 'package:crookhunt/ui/pages/level1/level1.dart';
import 'package:crookhunt/ui/pages/level2/level2.dart';
import 'package:crookhunt/ui/pages/level3/level3.dart';
import 'package:crookhunt/ui/pages/level4/level4.dart';
import 'package:crookhunt/ui/pages/level6/level6.dart';
import 'package:crookhunt/ui/pages/registerpage.dart';
import 'package:crookhunt/utils/firestoreservice.dart';
import 'package:flutter/material.dart';

class PageResolver extends StatelessWidget {
  const PageResolver({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirestoreService.getTeamData(context),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          default:
            if (snapshot.hasError) {
              log("Error: ${snapshot.error}");
              return Scaffold(
                body: Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            } else if (snapshot.data == null || snapshot.data!.isEmpty) {
              log("No team data available.");
              return const RegisterPage();
            } else {
              log("Team data: ${snapshot.data}");
            switch(snapshot.data!['progress'])
            {
              case "0": return const Answer0();
              case "1": return const Level1();
              case "2": return const Level2();
              case "3": return const Level3();
              case "4": return const Level4();
              case "5": return const Level5();
              case "6": return const Level6();
              default:return const Scaffold(body: Center(
                child: Text("Contact volunteer!"),
              ),);
            }
            }
        }
      },
    );
  }
}
