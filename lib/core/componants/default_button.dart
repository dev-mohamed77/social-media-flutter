import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onClick,
    Color? color,
  })  : _color = color ?? Colors.blue,
        super(key: key);

  final String text;
  final void Function()? onClick;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(
          text,
          style: const TextStyle(
            color: ConfigColor.kWhiteColor,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: _color,
        ),
      ),
    );
  }
}
