import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protfolio/models/star_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? galaxyController;
  List<StarModel> stars = [];
  final int numOfStars = 150;
  final Random random = Random();
  late Size screenSize;
  Offset? cursorPosition;
  @override
  void initState() {
    galaxyController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    galaxyController!.addListener(
      () {
        setState(() {
          for (var star in stars) {
            star.move(screenSize);
          }
        });
      },
    );
    super.initState();
  }

  void initializeStars(Size size) {
    screenSize = size;
    stars = List.generate(
      numOfStars,
      (index) => randomStar(),
    );
  }

  StarModel randomStar() {
    return StarModel(
        position: Offset(
          random.nextDouble() * screenSize.width,
          random.nextDouble() * screenSize.height,
        ),
        speed: Offset(
          (random.nextDouble() - 0.5) * 2, // Random movement in x (-1 to 1)
          (random.nextDouble() - 0.5) * 2, // Random movement in y (-1 to 1)
        ),
        size: random.nextDouble() * 2 + 0.5,
        brightness: random.nextDouble());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (stars.isEmpty) {
          initializeStars(Size(constraints.maxWidth, constraints.maxHeight));
        }
        return CustomPaint(
          painter: GalaxyPainter(stars: stars),
        );
      }),
    );
  }

  @override
  void dispose() {
    galaxyController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

class GalaxyPainter extends CustomPainter {
  final List<StarModel> stars;

  GalaxyPainter({super.repaint, required this.stars});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =Paint()..maskFilter=MaskFilter.blur(BlurStyle.solid, 2.0);
    for(var start in stars){
      paint.color =Colors.white.withOpacity(start.brightness);
      canvas.drawCircle(start.position, start.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
