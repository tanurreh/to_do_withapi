import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Color color;
  final FontWeight fontWeight;
  const CustomText(
      {Key? key,
      required this.text,
      required this.textStyle,
      required this.color,
      required this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: textStyle.copyWith(color: color, fontWeight: fontWeight));
  }
}
