import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Профиль'),
      ),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 38),
              CircleAvatar(
                backgroundColor: AppColor.scaffoldColor,
                radius: 37,
                child: Icon(
                  CupertinoIcons.arrow_clockwise,
                  size: 74,
                  color: CupertinoColors.black,
                ),
              ),
              SizedBox(height: 15),
              Text(
                "Жанибек Амандос",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.black),
              ),
              SizedBox(height: 12),
              Text(
                "amandos.zhanibek@mail.ru",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColor.colorGrey),
              ),
              SizedBox(height: 27),
              Container(
                width: double.infinity,
                color: CupertinoColors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 21, left: 29, bottom: 22),
                  child: Text(
                    "Выйти",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: AppColor.colorRed),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
