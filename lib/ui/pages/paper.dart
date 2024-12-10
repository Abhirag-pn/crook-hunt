import 'package:crookhunt/ui/widgets/custompage.dart';
import 'package:crookhunt/ui/widgets/roundedrectangle.dart';
import 'package:flutter/material.dart';

class Paper extends StatelessWidget {
  final String text;
  final String? img;
  final bool clue;
  const Paper({super.key, required this.text, this.img,  this.clue=false});

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
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: 'Neucha', fontWeight: FontWeight.bold),
                ),
                if(img!=null)RoundedImageWidget(imagePath: img!,clue: clue,)
                
              ],
            ),
          ),
            )
        ),
      ),
    );
  }
}
