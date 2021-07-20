import 'package:amonyatest/src/screens/auth_Screen.dart';
import 'package:amonyatest/src/screens/register_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit)),
            BottomNavigationBarItem(icon: Icon(Icons.ac_unit))
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              switch (index) {
                case 0:
                  return AuthScreen();
                case 1:
                  return RegisterScreen();
                case 2:
                  return AuthScreen();
                default:
                  return RegisterScreen();
              }
            },
          );
        });
  }
}
