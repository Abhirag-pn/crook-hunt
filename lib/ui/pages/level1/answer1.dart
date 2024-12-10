import 'dart:developer';

import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';

import 'package:flutter/material.dart';

class Answer1 extends StatefulWidget {
  const Answer1({super.key,});

  @override
  State<Answer1> createState() => _PaperState();
}

class _PaperState extends State<Answer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/levelbg.jpg'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent,
        body: Center(
            child: OldPaperWidget(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
               const  Spacer(), 
               Text(
               
                    "Stage One",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        
                  ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                  ),
                 const  RoundedImageWidget(imagePath: "assets/images/level1/one.jpg",clue: true,),
                    SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                  ),
                   Text(
                    "Hint: Find the body",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontFamily: 'Neucha'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/20,
                  ),
               CustomTextFeild(hinttext: "Enter The Answer", controller: TextEditingController()),
              SizedBox(
                    height: MediaQuery.of(context).size.height/28,
                  ),
                  BouncingTextButton(button: "assets/images/submit.png", action: (){}),
                 
                 const  Spacer(),
              ],
            ),
          ),
            )
        ),
         floatingActionButton: 
            FloatingActionButton(
              heroTag: 'bt1',
                backgroundColor: Colors.brown,
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                   Navigator.pop(context);
                
                }),
      ),
    );
  }
}
