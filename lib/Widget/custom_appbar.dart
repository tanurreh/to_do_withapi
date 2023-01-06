// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget {
  String title;
  Color color;
  CustomAppBar({
    Key? key,
    required this.title,required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor:color,
      title: Text(title),
      centerTitle: true,
    );
  }
}
