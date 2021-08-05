import 'package:amonyatest/src/screens/auth/auth_Screen.dart';
import 'package:amonyatest/src/screens/main_Screen.dart';
import 'package:amonyatest/src/screens/news/bloc/news_bloc.dart';
import 'package:amonyatest/src/screens/profile/bloc/profiledata_bloc.dart';
import 'package:amonyatest/src/screens/register/bloc/register_bloc.dart';
import 'package:amonyatest/src/screens/register/register_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amonyatest/src/screens/auth/bloc/log_in_bloc.dart';

const String MainRoute = '/main';

const String AuthRoute = '/';
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
          builder: (context) => BlocProvider(
            create: (context) => LogInBloc(),
            child: AuthScreen(),
          ),
        );
      case RegisterRoute:
        return CupertinoPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterBloc(),
            child: RegisterScreen(),
          ),
        );
      case MainRoute:
        return CupertinoPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<ProfiledataBloc>(
                create: (BuildContext context) => ProfiledataBloc(),
              ),
            ],
            child: MainScreen(),
          ),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => AuthScreen(),
        );
    }
  }
}
