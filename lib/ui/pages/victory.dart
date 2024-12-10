import 'package:crookhunt/ui/pages/level0/Answer0.dart';
import 'package:crookhunt/ui/pages/paper.dart';
import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:flutter/material.dart';

class Victory extends StatefulWidget {
  const Victory({super.key});

  @override
  State<Victory> createState() => _RulesPageState();
}

class _RulesPageState extends State<Victory> {
  final TextEditingController codecontroller = TextEditingController();
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
          body: Container(
            color: Colors.black54,
            child: Center(
                child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 18,
              ),
              child: Column(
                children: [
                 const  Spacer(),
                  Text(
                    "Victory!",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                 
                  const Spacer()
                ],
              ),
            )),
          ),
        ));
  }
}
