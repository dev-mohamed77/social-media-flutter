import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class FloatingButton extends StatelessWidget {
  final void Function()? onClick;
  final IconData icon;

  const FloatingButton({
    Key? key,
    required this.onClick,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(context) {
    return FloatingActionButton(
      onPressed: onClick,
      child: Icon(icon),
      backgroundColor: ConfigColor.kblueColor,
    );
  }
}
