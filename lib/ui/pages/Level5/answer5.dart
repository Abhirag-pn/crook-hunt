import 'dart:developer';

import 'package:crookhunt/ui/pages/level6/level6.dart';
import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';

import 'package:flutter/material.dart';

class Answer5 extends StatefulWidget {
  const Answer5({
    super.key,
  });

  @override
  State<Answer5> createState() => _PaperState();
}

class _PaperState extends State<Answer5> {
  final level5controller=TextEditingController();
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
                Text("Stage Five",
                    style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                const RoundedImageWidget(
                  imagePath: "assets/images/level1/L5C.png",
                  clue: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Text(
                  "Hint: I stand and chill,with taps to pour,cold or hot im here for dure",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontFamily: 'Neucha'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                CustomTextFeild(
                    hinttext: "Enter The Answer",
                    controller: level5controller),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 28,
                ),
                BouncingTextButton(
                    button: "assets/images/submit.png", action: () {
                       if (level5controller.text.trim().toLowerCase() ==
                          "0497") {
                        Navigator.popUntil(
                          context,
                          (route) => route.isFirst,
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Level6(),
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
            child: const Icon(Icons.arrow_back,color:Color.fromARGB(255, 255, 244, 187)),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
