import 'package:flutter/material.dart';

class TextRichStroke extends StatefulWidget {
  const TextRichStroke({
    super.key,
    required this.textSpan,
    this.textAlign,
    this.strokeColor,
    this.strokeWidth,
    this.overflow,
  });

  final TextSpan textSpan;
  final TextAlign? textAlign;
  final Color? strokeColor;
  final double? strokeWidth;
  final TextOverflow? overflow;

  @override
  State<TextRichStroke> createState() => _TextRichStrokeState();
}

class _TextRichStrokeState extends State<TextRichStroke> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stroke Text
        RichText(
          textAlign: widget.textAlign ?? TextAlign.start,
          overflow: widget.overflow ?? TextOverflow.visible,
          text: _copyTextSpanWithStroke(widget.textSpan),
        ),
        // Fill Text
        RichText(
          textAlign: widget.textAlign ?? TextAlign.start,
          overflow: widget.overflow ?? TextOverflow.visible,
          text: widget.textSpan,
        ),
      ],
    );
  }

  TextSpan _copyTextSpanWithStroke(TextSpan span) {
    return TextSpan(
      text: span.text,
      style: span.style?.copyWith(
        foreground:
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widget.strokeWidth ?? 1.0
              ..color = widget.strokeColor ?? Colors.black,
      ),
      children: span.children?.map((child) => _copyTextSpanWithStroke(child as TextSpan)).toList(),
    );
  }
}
