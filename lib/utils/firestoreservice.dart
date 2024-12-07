import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crookhunt/utils/shared_pref_service.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  /// Saves team data to Firestore
  static Future<void> setTeamData(
      String teamid, String mem1, String mem2, String mem3, BuildContext context) async {
    try {
      await FirebaseFirestore.instance.collection("teams").doc(teamid).set({
        'teamid': teamid,
        'member1': mem1,
        'member2': mem2,
        'member3': mem3,
        'progress':"0"
      });
    } catch (e) {
      log("Failed to save team data: $e");
      _showSnackBar(context, "Failed to save team data: $e");
    }
  }

  /// Fetches team data from Firestore
  static Future<Map<String, dynamic>?> getTeamData(BuildContext context) async {
    try {
      final teamid = SharedPrefService.getTeamId();
      if (teamid == null || teamid.isEmpty) {
        log("Team ID is null or empty.");
        return null;
      }

      log("Fetching data for team ID: $teamid");
      final docSnap = await FirebaseFirestore.instance
          .collection('teams')
          .doc(teamid)
          .get();

      if (docSnap.exists) {
        log("Team data retrieved: ${docSnap.data()}");
        return docSnap.data();
      } else {
        log("No team data found for ID: $teamid");
        return null;
      }
    } catch (e) {
      log("Error fetching team data: $e");
      _showSnackBar(context, "Error fetching team data: $e");
      return null;
    }
  }

  /// Displays a SnackBar with error message
  static void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
