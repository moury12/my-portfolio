import 'dart:math';
import 'dart:ui';

class StarModel {
  Offset position;
  Offset speed;
  double size;
  double brightness;
  final Random random = Random();
  StarModel({
    required this.position,
    required this.speed,
    required this.size,
    required this.brightness,
  });
  void move(Size screenSize) {
    position += speed;
    if (position.dx < 0) position = Offset(screenSize.width, position.dy);
    if (position.dx > screenSize.width) position = Offset(0, position.dy);
    if (position.dy < 0) position = Offset(position.dx, screenSize.height);
    if (position.dy > screenSize.height) position = Offset(position.dx, 0);
    brightness =0.5 +random.nextDouble()*0.5;
  }
}
