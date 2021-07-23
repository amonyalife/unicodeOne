import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String placeholder;
  final bool isPassword;
  final Widget? iconField;
  final Widget? prefix;
  final Border? border;

  TextfieldWidget(
      {Key? key,
      required this.placeholder,
      this.isPassword = false,
      this.iconField,
      this.border,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
        suffix: iconField == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: iconField,
              ),
        obscureText: isPassword,
        placeholder: placeholder,
        prefix: prefix,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration:
            BoxDecoration(color: AppColor.textFieldColor, border: border));
  }
}
