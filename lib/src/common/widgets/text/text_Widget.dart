import 'package:flutter/cupertino.dart';

class TextWidget extends StatelessWidget {
  final String textData;
  final double? textSize;
  final FontWeight? textFontWeight;
  final Color? textColor;
  final TextOverflow? textOverflow;
  final int? maxLines;
  const TextWidget({
    Key? key,
    required this.textData,
    this.textSize,
    this.textFontWeight,
    this.textColor,
    this.textOverflow,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      textData,
      maxLines: maxLines,
      style: TextStyle(color: textColor),
    );
  }
}
