import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  final String hinttext;
  const CustomTextFeild({super.key, required this.hinttext});

  @override
  Widget build(BuildContext context) {
    return Center( // Centers the widget
      child: Stack(
        children: [
          Image.asset(
            'assets/images/textfeild.png',
            width: MediaQuery.of(context).size.width / 1.2,
            fit: BoxFit.contain,
          ),
          Positioned.fill( 
            child: Align(
              alignment: Alignment.center, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0), 
                child: TextFormField(
                  cursorColor:const Color(0xff2F1700) ,
                  
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(color: const Color(0xff2F1700)),
                  decoration:  InputDecoration(
                    hoverColor: const Color(0xff2F1700),
                    iconColor: const Color(0xff2F1700),
                    focusColor: const Color(0xff2F1700),
                    border: InputBorder.none, 
                    hintText: hinttext,
                    hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: const Color(0xff2F1700)),
                  
                    contentPadding: EdgeInsets.all(8), 
                ),
              ),
            ),
          ),)
        ],
      ),
    );
  }
}