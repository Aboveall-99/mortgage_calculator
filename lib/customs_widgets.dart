
import 'package:flutter/material.dart';

import 'constants.dart';

class RectThumbShape extends SliderComponentShape {
  const RectThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(28, 36);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final Canvas canvas = context.canvas;

    // Thumb rectangle
    final RRect thumb = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: center,
        width: 28,
        height: 32,
      ),
      const Radius.circular(8),
    );

    final Paint thumbPaint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white;

    canvas.drawRRect(thumb, thumbPaint);

    // Border
    final Paint borderPaint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawRRect(thumb, borderPaint);

    // Three grip lines
    final Paint linePaint = Paint()
      ..color = Colors.white38
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    const double spacing = 5;
    const double lineHeight = 12;

    for (int i = -1; i <= 1; i++) {
      final double x = center.dx + (i * spacing);

      canvas.drawLine(
        Offset(x, center.dy - lineHeight / 2),
        Offset(x, center.dy + lineHeight / 2),
        linePaint,
      );
    }
  }
}

class HelpIcon extends StatelessWidget {
  const HelpIcon({
    super.key,
    required this.text,
    required this.height,
    required this.width,
    required this.color
  });

  final String text;
  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
              color: Colors.grey.withValues(alpha: 0.0),
              width: 1.5
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black.withValues(alpha: 0.4),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
class MortgageSlider extends StatelessWidget {
  const MortgageSlider({
    super.key,
    required this.num,
    required this.max,
    required this.min,
    required this.onChanged,
    required this.divisions
  });

  final double num;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;
  final int divisions;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        thumbShape: RectThumbShape(),
        thumbColor: Color.fromRGBO(50, 62, 242, 1),
        activeTrackColor: Color.fromRGBO(233, 232, 235, 1)
      ),
      child: Slider(
          value: num,
          min: min,
          max: max,
          divisions: divisions,
          onChanged: onChanged
      ),
    );
  }
}


class GestureButton extends StatelessWidget {
  const GestureButton({
    super.key,
    required this.text,
    required this.onTap
  });

  final String text;
  final Function onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap.call();
      },
      child: SizedBox(
        height: 78,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(50, 62, 242, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(text,
              style: kButtonStyle,
            ),
          ),
        ),
      ),
    );
  }
}








