import 'package:amonyatest/src/common/widgets/btn_button/btn_Button.dart';
import 'package:amonyatest/src/common/widgets/divider/divider.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:flutter/cupertino.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        middle: Text('Регистрация'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 32),
                  TextfieldWidget(placeholder: "Логин"),
                  DividerWidget(),
                  TextfieldWidget(placeholder: "Телефон"),
                  DividerWidget(),
                  TextfieldWidget(placeholder: "Почта"),
                  DividerWidget(),
                  TextfieldWidget(
                    isPassword: true,
                    placeholder: "Пароль",
                    iconField: Icon(
                      CupertinoIcons.eye_slash_fill,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 56.0),
              child: BtnButton(title: "Создать аккаунт", onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
