import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

class OldPaperWidget extends StatelessWidget {
  final Widget? child;
  final ui.Image? image; // The image to display on the paper

  const OldPaperWidget({
    super.key,
    this.child,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    // Make the size responsive to the screen
    final Size screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width * 0.9; // 90% of screen width
    final double height = screenSize.height * 0.9; // 90% of screen height

    return RepaintBoundary(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter: TornPaperPainter(image: image),
          ),
          if (child != null)
            SizedBox(
              width: width * 0.95, // Slight padding inside the paper
              height: height * 0.95,
              child: child,
            ),
        ],
      ),
    );
  }
}

class TornPaperPainter extends CustomPainter {
  final ui.Image? image;

  TornPaperPainter({this.image});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paperPaint = Paint()
      ..color = const Color.fromARGB(255, 255, 244, 187)
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = Colors.brown.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    // Create the torn edges
    Path paperPath = _createTornPath(size);

    // Draw the torn paper background
    canvas.drawPath(paperPath, paperPaint);

    // Add border for emphasis
    canvas.drawPath(paperPath, borderPaint);

    // Draw the image if available
    if (image != null) {
      final double padding = 20.0; // Padding around the image
      final double imageWidth = size.width - 2 * padding;
      final double imageHeight = size.height / 2; // Half the height of the paper

      final Rect imageRect = Rect.fromLTWH(
        padding,
        padding,
        imageWidth,
        imageHeight,
      );

      final Paint imagePaint = Paint();
      canvas.drawImageRect(
        image!,
        Rect.fromLTWH(0, 0, image!.width.toDouble(), image!.height.toDouble()),
        imageRect,
        imagePaint,
      );
    }
  }

  Path _createTornPath(Size size) {
    Path path = Path();

    // Top edge
    path.moveTo(0, _randomEdgeVariation());
    for (double x = 0; x < size.width; x += 15) {
      path.lineTo(x, _randomEdgeVariation());
    }

    // Right edge
    for (double y = 0; y < size.height; y += 15) {
      path.lineTo(size.width - _randomEdgeVariation(), y);
    }

    // Bottom edge
    for (double x = size.width; x > 0; x -= 15) {
      path.lineTo(x, size.height - _randomEdgeVariation());
    }

    // Left edge
    for (double y = size.height; y > 0; y -= 15) {
      path.lineTo(_randomEdgeVariation(), y);
    }

    path.close();
    return path;
  }

  double _randomEdgeVariation() {
    Random random = Random();
    return random.nextDouble() * 10; // Variation up to 10 pixels for jagged effect
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
