import 'package:crookhunt/ui/pages/paper.dart';
import 'package:crookhunt/ui/widgets/bouncingtextbutton.dart';
import 'package:crookhunt/ui/widgets/customtextfeild.dart';
import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
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
                    "Rules",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "1.	Participants must not damage or destroy any clues placed at various locations within the college.",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontFamily: 'Neucha'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "2.	Team members should only communicate with their own team members and must refrain from interacting with other teams or non-participating students.",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontFamily: 'Neucha'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "3.	Any participant found violating these rules will result in immediate disqualification of their team.",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontFamily: 'Neucha'),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 15,
                  ),
                  CustomTextFeild(
                      hinttext: "Secret code", controller: codecontroller),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),
                  BouncingTextButton(
                      button: "assets/images/submit.png", action: () {
                        if(codecontroller.text.toLowerCase().trim()=="100100"){

                            // ignore: prefer_const_constructors
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Paper(text: ""),));
                        }
                      }),
                  const Spacer()
                ],
              ),
            )),
          ),
        ));
  }
}
