import 'dart:developer';

import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';

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
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    "Hint: Find the body",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontFamily: 'Neucha'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
               CustomTextFeild(hinttext: "Enter The Answer", controller: TextEditingController()),
              const SizedBox(
                    height: 50,
                  ),
                  BouncingTextButton(button: "assets/images/submit.png", action: (){}),
                  const  Spacer(),
              ],
            ),
          ),
            )
        ),
        floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'bt1',
                backgroundColor: Colors.brown,
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                   Navigator.pop(context);
                
                }),
            const SizedBox(
              width: 30,
            ),
            FloatingActionButton(
              heroTag: 'bt2',
                backgroundColor: Colors.brown,
                child: const Icon(Icons.arrow_forward),
                onPressed: () {
                  
                log("Next level"); 
                }),
          ],
        ),
      ),
    );
  }
}
