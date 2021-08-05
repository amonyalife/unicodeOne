import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/common/utils/app_textSyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('tokens');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = AuthRoute;

  @override
  void initState() {
    // Получаем Box токенов
    Box tokensBox = Hive.box('tokens');

    // Делаем проверку если access или refresh токены равны 'null'
    if (tokensBox.get('access') != null || tokensBox.get('refresh') != null) {
      // Если пользователь будет авторизован, то в консоле отобразиться текст "Открываю MainScreen"
      print("Открываю MainScreen");
      initialRoute = MainRoute;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(
            fontFamily: FontFamily,
            color: CupertinoColors.black,
            fontSize: 16,
          ),
        ),
        scaffoldBackgroundColor: AppColor.scaffoldColor,
        barBackgroundColor: CupertinoColors.white,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: initialRoute,
    );
  }
}
