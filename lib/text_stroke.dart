import 'package:flutter/material.dart';

class TextStroke extends StatefulWidget {
  const TextStroke({
    super.key,
    required this.text,
    this.style,
    this.strokeColor,
    this.strokeWidth,
    this.textAlign,
    this.overflow,
  });

  final String text;
  final TextStyle? style;
  final Color? strokeColor;
  final double? strokeWidth;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  @override
  State<TextStroke> createState() => _TextStrokeState();
}

class _TextStrokeState extends State<TextStroke> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          widget.text,
          style: widget.style?.copyWith(
            foreground:
                Paint()
                  ..style = PaintingStyle.stroke
                  ..color = widget.strokeColor ?? Colors.black
                  ..strokeWidth = widget.strokeWidth ?? 1.0,
          ),
          textAlign: widget.textAlign,
          overflow: widget.overflow,
        ),
        Text(widget.text, style: widget.style, textAlign: widget.textAlign, overflow: widget.overflow),
      ],
    );
  }
}
