import 'dart:developer';

import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/utils/firestoreservice.dart';
import 'package:crookhunt/utils/shared_pref_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController idcontroller=TextEditingController();
  final TextEditingController mem1controller=TextEditingController();
  final TextEditingController mem2controller=TextEditingController();
  final TextEditingController mem3controller=TextEditingController();

@override
  void initState() {
    if(SharedPrefService.getTeamId()!=null)
    {
      log(SharedPrefService.getTeamId()!);
      log("Team Exists");
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg.jpg',),fit:BoxFit.cover )),
      child: Scaffold(
        
          backgroundColor: Colors.transparent,
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration:const  BoxDecoration(
               color: Colors.black54
          ),
          child: Column(
            children: [
            const   Spacer(),
              Image.asset('assets/images/header.png',height: MediaQuery.of(context).size.height/5,),
              CustomTextFeild(hinttext: "Team ID",controller: idcontroller,),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              CustomTextFeild(hinttext: "Member 1",controller: mem1controller,),
             SizedBox(height: MediaQuery.of(context).size.height/30,),
              CustomTextFeild(hinttext: "Member 2",controller: mem2controller,),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              CustomTextFeild(hinttext: "Member 3",controller: mem3controller,),
              SizedBox(height: MediaQuery.of(context).size.height/30,),
              BouncingTextButton(button: "assets/images/start.png", action: ()async{
                final teamid=idcontroller.text.toLowerCase().trim();
                final mem1=mem1controller.text.toLowerCase().trim();
                final mem2=mem2controller.text.trim();
                final mem3=mem3controller.text.trim();
                idcontroller.clear();
                mem1controller.clear();
              mem2controller.clear();
              mem3controller.clear();
               await SharedPrefService.setTeamId(teamid);
                await FirestoreService.setTeamData(teamid, mem1, mem2, mem3,context);
                
              }),
            
              const Spacer()
            ],
          ),
          ),
    ));
  }
}