//Gradient BG

import 'package:flutter/material.dart';

class RGradientBackground extends StatefulWidget {
  final Widget child;

  const RGradientBackground({Key key, this.child}) : super(key: key);
  @override
  _RGradientBackgroundState createState() => _RGradientBackgroundState();
}

class _RGradientBackgroundState extends State<RGradientBackground>
    with TickerProviderStateMixin {
  AnimationController animController;
  Animation animation;

  List<Color> c = [
    Color(0xFFF23D3D),
    Colors.blue,
    Color(0xFF25D9B8),
    Color(0xFFFAA36B)
  ];

  @override
  void initState() {
    super.initState();
    animController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 0, end: 1).animate(animController);

    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        index++;
        animController.forward(from: 0);
      }
    });
    animController.forward();
  }

  int index = 0;

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animController,
      builder: (context, child) {
        // return Container(
        //   color: Colors.white,
        //   child: child,
        // );
        return CustomPaint(
          painter: _RGradientBackgroundPainter(getColor(index),
              getColor(index + 1), getColor(index + 2), getColor(index + 3)),
          child: child,
        );
      },
      child: widget.child,
    );
  }

  Color getColor(int i) {
    return Color.lerp(c[i % 4], c[(i + 1) % 4], animation.value);
  }
}

class _RGradientBackgroundPainter extends CustomPainter {
  final Color c1;
  final Color c2;
  final Color c3;
  final Color c4;
  Color topLayerColor = Colors.white.withAlpha(100);

  _RGradientBackgroundPainter(this.c1, this.c2, this.c3, this.c4);

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;
    var gradient = RadialGradient(
      colors: [c1, c2],
      center: Alignment(-1, -1),
      stops: [0, .8],
      radius: 3,
    );
    var gradient2 = RadialGradient(
      colors: [c3, Colors.white.withAlpha(0)],
      center: Alignment(-1, 1),
      stops: [0, .4],
      radius: 2,
    );
    var gradient3 = RadialGradient(
      colors: [c4, Colors.white.withAlpha(0)],
      center: Alignment(1, .1),
      stops: [0, 1],
      radius: 2,
    );
    var p = Paint();
    p.shader = gradient.createShader(rect);
    canvas.drawRect(rect, p);
    p.shader = gradient2.createShader(rect);
    canvas.drawRect(rect, p);
    p.shader = gradient3.createShader(rect);
    canvas.drawRect(rect, p);
    canvas.drawRect(rect, Paint()..color = topLayerColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
