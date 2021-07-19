import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class TextfieldWidget extends StatelessWidget {
  final String placeholder;
  final bool isPassword;

  TextfieldWidget(
      {Key? key, required this.placeholder, this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      obscureText: isPassword,
      placeholder: placeholder,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColor.textFieldColor,
      ),
    );
  }
}
