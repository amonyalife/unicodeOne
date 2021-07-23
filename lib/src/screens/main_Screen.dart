import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/screens/favorite_Screen.dart';
import 'package:amonyatest/src/screens/map_Screen.dart';
import 'package:amonyatest/src/screens/news_Screend.dart';
import 'package:amonyatest/src/screens/profile_Screen.dart';
import 'package:amonyatest/src/screens/register_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          inactiveColor: Colors.black,
          activeColor: Colors.red,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie_filter)),
            BottomNavigationBarItem(icon: Icon(Icons.navigation)),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border)),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
              onGenerateRoute: AppRouter.generateRoute,
              builder: (context) {
                switch (index) {
                  case 0:
                    return NewsScreen();
                  case 1:
                    return MapScreen();
                  case 2:
                    return FavoriteScreen();
                  case 3:
                    return ProfileScreen();
                  default:
                    return RegisterScreen();
                }
              });
        });
  }
}
