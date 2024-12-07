import 'package:crookhunt/utils/firestoreservice.dart';
import 'package:flutter/material.dart';

class Intropage extends StatefulWidget {
  final String teamid;
  const Intropage({super.key, required this.teamid});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  
   String? teamid,mem1,mem2,mem3,progress;

  @override
  void initState() {
    teamid=widget.teamid;
    FirestoreService.getTeamData(context).then((doc)
    {
    mem1=doc!['member1'];
    mem2=doc['member2'];
    mem3=doc['member3'];
    progress=doc['progress'];
    setState(() {
      
    });
    });
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("teamid: $teamid"),
          Text("member1: $mem1"),
          Text("member2: $mem2"),
          Text("member3: $mem3"),
          Text("progress: $progress")
        ],
      ),),
    );
  }
}