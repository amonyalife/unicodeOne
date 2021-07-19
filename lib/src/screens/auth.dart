import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/widgets/btn_button/btn_Button.dart';
import 'package:amonyatest/src/common/widgets/divider/divider.dart';
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
            TextfieldWidget(placeholder: "логин или почта"),
            DividerWidget(),
            TextfieldWidget(placeholder: "пароль"),
            SizedBox(height: 32),
            BtnButton(title: "Войти", onPressed: () {}),
            SizedBox(height: 19),
            BtnButton(title: "Зарегистрироваться", onPressed: () {})
          ],
        ),
      ),
    );
  }
}
