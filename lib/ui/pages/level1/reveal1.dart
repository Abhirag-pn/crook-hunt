import 'dart:developer';

import 'package:crookhunt/ui/pages/level2/level2.dart';
import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';

import 'package:flutter/material.dart';

class Reveal1 extends StatefulWidget {
  const Reveal1({
    super.key,
  });

  @override
  State<Reveal1> createState() => _PaperState();
}

class _PaperState extends State<Reveal1> {
  final level1controller=TextEditingController();
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
                const Spacer(),
                Text("!!!!",
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                const RoundedImageWidget(
                  imagePath: "assets/images/level1/L1R.jpg",
                 
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
               
                
                BouncingTextButton(
                    button: "assets/images/submit.png", action: () 
                    {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Level2(),));
                    }),
                const Spacer(),
              ],
            ),
          ),
        )),
       
      ),
    );
  }
}