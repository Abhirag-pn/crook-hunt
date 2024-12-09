import 'package:crookhunt/ui/pages/paper.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

class PageTest extends StatefulWidget {
  const PageTest({super.key});

  @override
  State<PageTest> createState() => _PageTestState();
}

class _PageTestState extends State<PageTest> {
  final controller = TurnPageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TurnPageView.builder(
        controller: controller,
        itemCount: 10,
        itemBuilder: (context, index) => Paper(text: index.toString()),
        overleafColorBuilder: (index) => Colors.brown.withOpacity(0.5),
        animationTransitionPoint: 0.2,
      ),
      floatingActionButton: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                backgroundColor: Colors.brown,
                child: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    controller.previousPage();
                  });
                }),
            const SizedBox(
              width: 30,
            ),
            FloatingActionButton(
                backgroundColor: Colors.brown,
                child: const Icon(Icons.arrow_forward),
                onPressed: () {
                  controller.nextPage();
                 
                }),
          ],
        ),
    );
  }
}