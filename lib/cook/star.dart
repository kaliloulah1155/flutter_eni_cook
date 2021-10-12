import 'package:flutter/material.dart';
class Star extends StatelessWidget {

  final Color ? color;
  final double ? size;

   Star({Key? key, this.color, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _StartPainter(color: color),
      ),
    );
  }
}

class _StartPainter extends CustomPainter{
  final Color ? color;
  _StartPainter({this.color});

  @override
  void paint(Canvas canvas, Size size) {
     final paint=Paint()..color=color!;

     final path=Path();
     path.moveTo(size.width*0.5, 0);
     path.lineTo(size.width*0.618, size.height*0.382);
     path.lineTo(size.width, size.height*0.382);
     path.lineTo(size.width*0.691, size.height*0.618);
     path.lineTo(size.width*0.809, size.height);
     path.lineTo(size.width*0.5, size.height*0.7639);
     path.lineTo(size.width*0.191, size.height);
     path.lineTo(size.width*0.309, size.height*0.618);
     path.lineTo(size.width*0.309, size.height*0.618);
     path.lineTo(0, size.height*0.382);
     path.lineTo(size.width*0.382, size.height*0.382);

     canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class StarRating extends StatelessWidget {
  final Color  color;
  final int ? value;
  final double  starSize;

   StarRating({
    Key? key,
    this.color=Colors.deepOrange,
    @required this.value,
    this.starSize=25
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
          value!,
          (_) => Padding(
              padding: EdgeInsets.all(2.0),
            child: Star(
              color:color,
              size: starSize,
            ),
          ),
      ),
    );
  }
}

