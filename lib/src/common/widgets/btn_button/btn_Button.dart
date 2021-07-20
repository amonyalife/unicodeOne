import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

class BtnButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const BtnButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CupertinoButton(
        color: AppColor.btnColor,
        padding: EdgeInsets.symmetric(vertical: 19),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
