import 'dart:developer';

import 'package:crookhunt/ui/pages/level1/answer1.dart';
import 'package:crookhunt/ui/pages/level2/answer2.dart';

import 'package:crookhunt/ui/pages/level2/level2content.dart';
import 'package:crookhunt/ui/pages/paper.dart';
import 'package:flutter/material.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class Level2 extends StatefulWidget {
  const Level2({super.key});

  @override
  State<Level2> createState() => _LevelOneState();
}

class _LevelOneState extends State<Level2> {
  int currentIndex=0;
  final controller = TurnPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        useOnSwipe: false,
        controller: controller,
        itemCount: content2.length,
        itemBuilder: (context, int index) => Paper(text: content2[index].text,img:content2[index].image ,),
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
                    if(currentIndex>0&&currentIndex<content2.length)
                    {currentIndex-=1;
                    controller.previousPage();}
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
                  
                  if(currentIndex==content2.length-1)
                  {
                    Navigator.push(context,TurnPageRoute(
                  overleafColor:Colors.brown.withOpacity(0.5),
                  animationTransitionPoint: 0.3,
                  transitionDuration: const Duration(milliseconds: 300),
                  reverseTransitionDuration: const Duration(milliseconds: 300),
                  builder: (context) => const Answer2(),));
                    
                    return;
                  }
                  if(currentIndex<content2.length-1){
                    currentIndex+=1;
                     controller.nextPage();
                  }
                 
                  
                 
                }),
          ],
        ),
    );
  }
}