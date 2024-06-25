import 'package:flutter/material.dart';
import 'package:palm_code/resources/theme.dart';

class CircularProgressWidget extends StatefulWidget {
  final bool? withBackground;
  const CircularProgressWidget({
    super.key,
    this.withBackground,
  });

  @override
  State<CircularProgressWidget> createState() => _CircularProgressWidgetState();
}

class _CircularProgressWidgetState extends State<CircularProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: (widget.withBackground ?? false)
            ? BoxDecoration(
                color: Theme.of(context).backgroundLightest,
                shape: BoxShape.circle,
              )
            : null,
        padding: (widget.withBackground ?? false)
            ? const EdgeInsets.all(10)
            : EdgeInsets.zero,
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_animationController),
          child: GradientCircularProgressIndicator(
            radius: 24,
            gradientColors: Theme.of(context).circularProgress,
          ),
        ),
      ),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  const GradientCircularProgressIndicator({
    super.key,
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 7.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  double _degreeToRad(double degree) => degree * 3.14 / 180;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerPoint = size.height / 2;

    final Paint paint = Paint()
      ..color = gradientColors[0]
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    paint.shader = SweepGradient(
      colors: gradientColors,
      tileMode: TileMode.repeated,
      startAngle: _degreeToRad(270),
      endAngle: _degreeToRad(270 + 360.0),
    ).createShader(
      Rect.fromCircle(
        center: Offset(centerPoint, centerPoint),
        radius: 0,
      ),
    );
    final scapSize = strokeWidth * 1;
    final double scapToDegree = scapSize / centerPoint;
    final double startAngle = _degreeToRad(270) + scapToDegree;
    final double sweepAngle = _degreeToRad(360) - (2 * scapToDegree);

    canvas.drawArc(
      Offset.zero & Size(size.width, size.width),
      startAngle,
      sweepAngle,
      false,
      paint..color = gradientColors[0],
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
