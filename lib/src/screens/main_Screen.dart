import 'package:amonyatest/src/common/utils/app_routes.dart';
import 'package:amonyatest/src/screens/favorite_Screen.dart';
import 'package:amonyatest/src/screens/map_Screen.dart';
import 'package:amonyatest/src/screens/news/bloc/news_bloc.dart';
import 'package:amonyatest/src/screens/news/news_Screend.dart';
import 'package:amonyatest/src/screens/profile/bloc/profiledata_bloc.dart';
import 'package:amonyatest/src/screens/profile/profile_Screen.dart';
import 'package:amonyatest/src/screens/register/register_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    BlocProvider.of<ProfiledataBloc>(context).add(InitialProfileEvent());
    BlocProvider.of<NewsBloc>(context).add(InitialNews());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
                backgroundColor: CupertinoColors.separator,
                inactiveColor: CupertinoColors.black,
                activeColor:
                    CupertinoColors.activeGreen, // красный сделаю позже
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.news)), // поменяю сделаю позже
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.map)), // поменяю сделаю позже
                  BottomNavigationBarItem(
                      icon: Icon(CupertinoIcons.heart)), // поменяю сделаю позже
                  BottomNavigationBarItem(
                    icon: Icon(
                      (CupertinoIcons.profile_circled), // поменяю сделаю позже
                    ),
                  )
                ]),
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
            }));
  }
}
