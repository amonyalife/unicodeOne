import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/common/widgets/text/text_Widget.dart';
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
                  Icons.account_circle_outlined,
                  size: 74,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 15),
              TextWidget(
                  textData: "Жанибек Амандос",
                  textSize: 24,
                  textFontWeight: FontWeight.w600,
                  textColor: Colors.black),
              SizedBox(height: 12),
              TextWidget(
                  textData: "amandos.zhanibek@mail.ru",
                  textSize: 16,
                  textFontWeight: FontWeight.w400,
                  textColor: AppColor.colorGrey),
              SizedBox(height: 27),
              Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 21, left: 29, bottom: 22),
                  child: TextWidget(
                      textData: "Выйти",
                      textSize: 16,
                      textFontWeight: FontWeight.w400,
                      textColor: AppColor.colorRed),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
