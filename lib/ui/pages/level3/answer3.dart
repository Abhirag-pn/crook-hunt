import 'dart:developer';

import 'package:crookhunt/ui/pages/level3/level3.dart';
import 'package:crookhunt/ui/pages/level4/level4.dart';
import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';

import 'package:flutter/material.dart';

class Answer3 extends StatefulWidget {
  const Answer3({
    super.key,
  });

  @override
  State<Answer3> createState() => _PaperState();
}

class _PaperState extends State<Answer3> {
  final level3controller = TextEditingController();
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
                Text("Stage Three",
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                const RoundedImageWidget(
                  imagePath: "assets/images/level1/L3C.jpg",
                  clue: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Text(
                  "Hint: Go to the ashes where the fire once burned,and let your journey continue ever onward",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: 'Neucha'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                CustomTextFeild(
                    hinttext: "Enter The Answer", controller: level3controller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 28,
                ),
                BouncingTextButton(
                    button: "assets/images/submit.png",
                    action: () {
                      if (level3controller.text.trim().toLowerCase() ==
                              "keyboard") {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Level4(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Wrong Answer!",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontFamily: 'Neucha',
                                  color:
                                      const Color.fromARGB(255, 255, 244, 187)),
                        )));
                      }
                    }),
                const Spacer(),
              ],
            ),
          ),
        )),
        floatingActionButton: FloatingActionButton(
            heroTag: 'bt1',
            backgroundColor: Colors.brown,
            child: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 255, 244, 187)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
