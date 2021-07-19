import 'package:amonyatest/src/screens/auth.dart';
import 'package:amonyatest/src/screens/register.dart';
import 'package:flutter/cupertino.dart';

const String MainRoute = '/';

const String AuthRoute = '/auth/login';
const String RegisterRoute = '/auth/register';

class AppRouter {
  static Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AuthRoute:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => RegisterScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}
