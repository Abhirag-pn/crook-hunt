import 'dart:developer';
import 'package:crookhunt/ui/pages/loadingpage.dart';
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
            return const LoadingPage();
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
              return Scaffold(
                body: Center(
                  child: Text(
                    snapshot.data!['progress'],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              );
            }
        }
      },
    );
  }
}
