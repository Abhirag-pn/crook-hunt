import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              Spacer(),
              Image.asset('assets/images/header.png',height: MediaQuery.of(context).size.height/5,),
              CustomTextFeild(hinttext: "Team ID",),
              SizedBox(height: 20,),
              CustomTextFeild(hinttext: "Member 1",),
              SizedBox(height: 20,),
              CustomTextFeild(hinttext: "Member 2",),
              SizedBox(height: 20,),
              CustomTextFeild(hinttext: "Member 3",),
              SizedBox(height: 30,),
              BouncingTextButton(button: "assets/images/start.png", action: (){}),
              Spacer()
            ],
          ),
          ),
    ));
  }
}