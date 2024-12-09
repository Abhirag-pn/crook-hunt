import 'package:crookhunt/ui/pages/imagedisplay.dart';
import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String imagePath; // Path to the image asset

  const RoundedImageWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the widget is responsive
    final double width = MediaQuery.of(context).size.width * 0.8; // 80% of screen width
    final double height = width * 0.6; // Aspect ratio for the rectangle

    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Imagedisplay(img: imagePath),));
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
           // Rounded corners
          border: Border.all(
            color: Colors.brown.shade700, // Border color
            width: 4, // Border width
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 8, // Blur radius
              offset: const Offset(0, 4), // Shadow offset
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: BoxFit.fill, // Ensure the image covers the container area
        ),
      ),
    );
  }
}
