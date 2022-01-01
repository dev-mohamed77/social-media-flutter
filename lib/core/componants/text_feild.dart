import 'package:flutter/material.dart';
import 'package:socailmedia/core/utils/color_manager.dart';

class DefaultTextField extends StatelessWidget {
  final String? Function(String?)? valid;
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final TextInputType? keyType;
  final bool isShowPassword;
  final bool isPass;
  final IconData? iconSuffix;
  final void Function()? onClickSuffix;

  const DefaultTextField({
    Key? key,
    this.valid,
    this.hintText,
    this.errorText,
    this.controller,
    this.isShowPassword = false,
    this.keyType,
    this.isPass = false,
    this.iconSuffix,
    this.onClickSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      controller: controller,
      keyboardType: keyType,
      obscureText: isShowPassword,
      decoration: InputDecoration(
        hintText: hintText,
        errorText: errorText,
        suffixIcon: isPass
            ? IconButton(
                onPressed: onClickSuffix,
                icon: Icon(isPass ? iconSuffix : null),
              )
            : null,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: ConfigColor.kgreyColor, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConfigColor.kgreyColor, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ConfigColor.kgreyColor, width: 2),
        ),
      ),
    );
  }
}
