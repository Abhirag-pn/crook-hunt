import 'package:crookhunt/ui/pages/pageresolver.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 3000)).then((val)
    {Navigator.popUntil(context,(route,) => route.isFirst,);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => PageResolver(),));
    });
   
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/bg-min.jpg'),fit: BoxFit.cover)
        )
        ,
        child: Column(
          children: [
            const Spacer(flex: 3,),
            Image.asset('assets/images/header.png',height: MediaQuery.of(context).size.height/5,),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
              
                LottieBuilder.asset('assets/images/loading.json',height: MediaQuery.of(context).size.height/6,),
                  Text("Loading...",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),),
              ],
            ),
            const  Spacer(flex: 3,),
          ],
        ),
      )
    );
  }
}