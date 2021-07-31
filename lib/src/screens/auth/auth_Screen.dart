import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/common/widgets/btn_button/btn_Button.dart';
import 'package:amonyatest/src/common/widgets/divider/divider.dart';
import 'package:amonyatest/src/common/widgets/textfield/txt_TextField.dart';
import 'package:amonyatest/src/screens/auth/bloc/log_in_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

final Dio dio = Dio();
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
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
            TextfieldWidget(
                placeholder: "логин или почта", controller: emailController),
            DividerWidget(),
            TextfieldWidget(
                placeholder: "пароль,", controller: passwordController),
            SizedBox(height: 32),
            BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInLoaded) {
                  Navigator.pushReplacementNamed(context, MainRoute);
                } else if (state is LogInFailed) {
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
                  title: 'Войти',
                  onPressed: state is LogInLoading
                      ? null
                      : () {
                          context.read<LogInBloc>().add(
                                LogInPressed(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                        },
                );
              },
            ),
            SizedBox(height: 19),
            BtnButton(
              title: "Зарегистрироваться",
              onPressed: () {
                Navigator.pushNamed(context, RegisterRoute);
              },
            ),
            SizedBox(height: 19),
          ],
        ),
      ),
    );
  }
}
