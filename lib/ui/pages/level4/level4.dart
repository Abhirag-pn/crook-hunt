import 'dart:developer';

import 'package:crookhunt/ui/pages/Level4/answer4.dart';
import 'package:crookhunt/ui/pages/Level4/Level4content.dart';

import 'package:crookhunt/ui/pages/paper.dart';
import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class Level4 extends StatefulWidget {
  const Level4({super.key});

  @override
  State<Level4> createState() => _LevelOneState();
}

class _LevelOneState extends State<Level4> {
  int currentIndex = 0;
  final controller = TurnPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        useOnSwipe: false,
        controller: controller,
        itemCount: content4.length,
        itemBuilder: (context, int index) => Paper(
          text: content4[index].text,
          img: content4[index].image,
        ),
        overleafColorBuilder: (index) => Colors.brown.withOpacity(0.5),
        animationTransitionPoint: 0.2,
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'bt1',
              backgroundColor: Colors.brown,
              child: const Icon(Icons.arrow_back,color:Color.fromARGB(255, 255, 244, 187)),
              onPressed: () {
                log(currentIndex.toString());
                setState(() {
                  if (currentIndex > 0 && currentIndex < content4.length) {
                    currentIndex -= 1;
                    controller.previousPage();
                  }
                });
              }),
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
              heroTag: 'bt2',
              backgroundColor: Colors.brown,
              child: const Icon(Icons.arrow_forward,color:Color.fromARGB(255, 255, 244, 187)),
              onPressed: () {
                log(currentIndex.toString());

                if (currentIndex == content4.length - 1) {
                  Navigator.push(
                    context,
                    TurnPageRoute(
                      overleafColor: Colors.brown.withOpacity(0.5),
                      animationTransitionPoint: 0.2,
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                      builder: (context) => const Answer4(),
                    ),
                  );

                  return;
                }
                if (currentIndex < content4.length - 1) {
                  currentIndex += 1;
                  controller.nextPage();
                }
              }),
        ],
      ),
    );
  }
}
