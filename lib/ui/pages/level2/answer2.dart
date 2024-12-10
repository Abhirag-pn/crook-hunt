import 'dart:developer';

import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';

import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key,});

  @override
  State<Answer2> createState() => _PaperState();
}

class _PaperState extends State<Answer2> {
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
               
                    "Stage Two",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        
                  ),
                 SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                  ),
                 const  RoundedImageWidget(imagePath: "assets/images/level1/L2C.jpg",clue: true,),
                    SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                  ),
                   Text(
                    "Hint: Only the brave who let things go find find what lies below",
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
                child: const Icon(Icons.arrow_back,color:Color.fromARGB(255, 255, 244, 187)),
                onPressed: () {
                   Navigator.pop(context);
                
                }),
      ),
    );
  }
}
