import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

class Imagedisplay extends StatelessWidget {
  final String img;
  const Imagedisplay({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: const Color.fromARGB(255, 255, 244, 187),)),
      ),
      backgroundColor: Colors.black,
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: PinchZoom(
          child: Image.asset(
            img,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
