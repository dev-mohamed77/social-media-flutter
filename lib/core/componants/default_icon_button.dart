import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class DefaultIconButton extends StatelessWidget {
  const DefaultIconButton({
    Key? key,
    required this.onClick,
    required this.icon,
  }) : super(key: key);

  final void Function()? onClick;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      icon: CircleAvatar(
        radius: 25,
        backgroundColor: ConfigColor.kgreyColor.withOpacity(0.4),
        child: Icon(
          icon,
          color: ConfigColor.kDarkColor,
          size: 20,
        ),
      ),
    );
  }
}
