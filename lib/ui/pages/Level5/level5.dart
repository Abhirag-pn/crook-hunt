import 'dart:developer';

import 'package:crookhunt/ui/pages/Level5/answer5.dart';
import 'package:crookhunt/ui/pages/Level5/Level5content.dart';
import 'package:crookhunt/ui/pages/Level5/level5content.dart';
import 'package:crookhunt/ui/pages/paper.dart';
import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class Level5 extends StatefulWidget {
  const Level5({super.key});

  @override
  State<Level5> createState() => _LevelOneState();
}

class _LevelOneState extends State<Level5> {
  int currentIndex = 0;
  final controller = TurnPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        useOnSwipe: false,
        controller: controller,
        itemCount: content5.length,
        itemBuilder: (context, int index) => Paper(
          text: content5[index].text,
          img: content5[index].image,
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
              child: const Icon(Icons.arrow_back),
              onPressed: () {
                log(currentIndex.toString());
                setState(() {
                  if (currentIndex > 0 && currentIndex < content5.length) {
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
              child: const Icon(Icons.arrow_forward),
              onPressed: () {
                log(currentIndex.toString());

                if (currentIndex == content5.length - 1) {
                  Navigator.push(
                    context,
                    TurnPageRoute(
                      overleafColor: Colors.brown.withOpacity(0.5),
                      animationTransitionPoint: 0.2,
                      transitionDuration: const Duration(milliseconds: 300),
                      reverseTransitionDuration:
                          const Duration(milliseconds: 300),
                      builder: (context) => const Answer5(),
                    ),
                  );

                  return;
                }
                if (currentIndex < content5.length - 1) {
                  currentIndex += 1;
                  controller.nextPage();
                }
              }),
        ],
      ),
    );
  }
}
