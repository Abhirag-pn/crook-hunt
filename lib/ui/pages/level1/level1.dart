import 'dart:developer';

import 'package:crookhunt/ui/pages/level1/level1content.dart';
import 'package:crookhunt/ui/pages/paper.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class Level1 extends StatefulWidget {
  const Level1({super.key});

  @override
  State<Level1> createState() => _LevelOneState();
}

class _LevelOneState extends State<Level1> {
  int currentIndex=0;
  final controller = TurnPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        controller: controller,
        itemCount: content1.length,
        itemBuilder: (context, int index) => Paper(text: content1[index].text,img:content1[index].image ,),
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
                    if(currentIndex>0&&currentIndex<content1.length)
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
                  
                  if(currentIndex==content1.length-1)
                  {
                    log("Move to entry");
                    return;
                  }
                  if(currentIndex<content1.length-1){
                    currentIndex+=1;
                     controller.nextPage();
                  }
                  
                 
                }),
          ],
        ),
    );
  }
}