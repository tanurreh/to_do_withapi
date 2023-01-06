import 'package:flutter/material.dart';

class AddCustomSpace extends StatelessWidget {
  final double width, height;

  const AddCustomSpace({Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
