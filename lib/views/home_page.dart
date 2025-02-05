// import 'dart:async';
// import 'dart:math';
// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:protfolio/core/components/custom_text.dart';
// import 'package:protfolio/core/constant/text_style_constant.dart';
// import 'package:protfolio/core/constant/text_style_constant.dart';
// import 'package:protfolio/core/constant/text_style_constant.dart';
// import 'package:protfolio/models/star_model.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
//   AnimationController? galaxyController;
//   List<StarModel> stars = [];
//   final int numOfStars = 100;
//   final Random random = Random();
//   late Size screenSize;
//   Timer? animationThrottleTimer;
//
//   @override
//   void initState() {
//     super.initState();
//     galaxyController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     )..repeat(reverse: true);
//
//     galaxyController!.addListener(() {
//       // Throttle updates to avoid frequent setState calls
//       if (animationThrottleTimer == null || !animationThrottleTimer!.isActive) {
//         animationThrottleTimer = Timer(Duration(milliseconds: 16), () {
//           setState(() {
//             for (var star in stars) {
//               star.move(screenSize);
//             }
//           });
//         });
//       }
//     });
//   }
//
//   void initializeStars(Size size) {
//     screenSize = size;
//     stars = List.generate(
//       numOfStars,
//           (index) => randomStar(),
//     );
//   }
//
//   StarModel randomStar() {
//     return StarModel(
//       position: Offset(
//         random.nextDouble() * screenSize.width,
//         random.nextDouble() * screenSize.height,
//       ),
//       speed: Offset(
//         (random.nextDouble() - 0.5) * 2, // Random movement in x
//         (random.nextDouble() - 0.5) * 2, // Random movement in y
//       ),
//       size: random.nextDouble() * 1 + 0.5,
//       brightness: random.nextDouble(),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final constraints = MediaQuery.of(context).size;
//
//     // Initialize stars only if the screen size changes
//     if (stars.isEmpty || screenSize.width != constraints.width || screenSize.height != constraints.height) {
//       initializeStars(constraints);
//     }
//
//     return Scaffold(
//       body: RepaintBoundary(
//         child: AnimatedBuilder(
//           animation: galaxyController!,
//           builder: (context, child) {
//             return CustomPaint(
//               painter: GalaxyPainter(stars: stars),
//               child: Column(
//                 children: [
//                   SizedBox(height: MediaQuery.of(context).viewPadding.top),
//                   Row(
//                     spacing: 16.0,
//                     children: [
//                       CustomText(text: 'About', style: tavirajSemiBold, fontSize: 12),
//                       CustomText(text: 'Skill', style: tavirajSemiBold, fontSize: 12),
//                       CustomText(text: 'Contact', style: tavirajSemiBold, fontSize: 12),
//                     ],
//                   ),
//                   ClipRect(
//                     child: BackdropFilter(
//                       filter: ImageFilter.blur(
//                         sigmaX: 5.0,
//                         sigmaY: 5.0,
//                         tileMode: TileMode.decal,
//                       ),
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: 200.0,
//                         height: 200.0,
//                         child: const Text('Hello World'),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     galaxyController!.dispose();
//     animationThrottleTimer?.cancel();  // Cancel throttle timer on dispose
//     super.dispose();
//   }
// }
//
// class GalaxyPainter extends CustomPainter {
//   final List<StarModel> stars;
//
//   GalaxyPainter({super.repaint, required this.stars});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()..maskFilter = MaskFilter.blur(BlurStyle.solid, 2.0);
//     for (var star in stars) {
//       paint.color = Colors.white.withOpacity(star.brightness);
//       canvas.drawCircle(star.position, star.size, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
//
