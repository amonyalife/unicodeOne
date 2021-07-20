import 'package:amonyatest/src/screens/auth_Screen.dart';
import 'package:amonyatest/src/screens/favorite_Screen.dart';
import 'package:amonyatest/src/screens/map_Screen.dart';
import 'package:amonyatest/src/screens/news_Screend.dart';
import 'package:amonyatest/src/screens/profile_Screen.dart';
import 'package:amonyatest/src/screens/register_Screen.dart';
import 'package:flutter/cupertino.dart';

const String MainRoute = '/';

const String AuthRoute = '/auth/login';
const String RegisterRoute = '/auth/register';
const String FavoriteRoute = '/main/favorite';
const String ProfileRoute = '/main/profile';
const String MapRoute = '/main/map';
const String NewsRoute = '/main/news';

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
      case FavoriteRoute:
        return CupertinoPageRoute(
          builder: (context) => FavoriteScreen(),
        );
      case ProfileRoute:
        return CupertinoPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => MapScreen(),
        );
      case NewsRoute:
        return CupertinoPageRoute(
          builder: (context) => NewsScreen(),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}
