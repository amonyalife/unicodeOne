import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/widgets/btn_button/btn_Button.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: AppColor.scaffoldColor,
      navigationBar: CupertinoNavigationBar(
        border: Border(),
        backgroundColor: CupertinoColors.white,
        middle: Text("Авторизация"),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextfieldWidget(fieldName: "логин или почта"),
            Container(
              height: 1,
              color: Color(0xFFE0E6ED),
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            TextfieldWidget(fieldName: "пароль"),
            SizedBox(height: 32),
            BtnButton(titleButton: "Войти", onPressed: () {}),
            SizedBox(height: 19),
            BtnButton(titleButton: "Зарегистрироваться", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
