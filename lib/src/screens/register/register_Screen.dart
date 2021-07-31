import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/common/widgets/btn_button/btn_Button.dart';
import 'package:amonyatest/src/common/widgets/divider/divider.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:amonyatest/src/screens/register/bloc/register_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nickName = TextEditingController();
  final TextEditingController _phonedController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
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
                  TextfieldWidget(
                    placeholder: "Логин",
                    controller: _nickName,
                  ),
                  DividerWidget(),
                  TextfieldWidget(
                      placeholder: "Телефон", controller: _phonedController),
                  DividerWidget(),
                  TextfieldWidget(
                      placeholder: "Почта", controller: _emailController),
                  DividerWidget(),
                  TextfieldWidget(
                    isPassword: true,
                    placeholder: "Пароль",
                    controller: _passwordController,
                    iconField: Icon(
                      CupertinoIcons.eye_slash_fill,
                    ),
                  )
                ],
              ),
            ),
            BlocConsumer<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoaded) {
                  Navigator.pushReplacementNamed(context, AuthRoute);
                } else if (state is RegisterFailed) {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Ошибка'),
                        content: Text(state.message ?? ''),
                        actions: [
                          CupertinoButton(
                            child: Text('ОК'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return BtnButton(
                  title: 'Зарегистрироваться',
                  onPressed: () => state is RegisterLoading
                      ? null
                      : () {
                          context.read<RegisterBloc>().add(RegisterPress(
                              email: _emailController.text,
                              password: _passwordController.text,
                              phoneNumber: _phonedController.text,
                              nickName: _nickName.text));
                        },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
