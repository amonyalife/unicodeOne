import 'package:amonyatest/src/common/utils/app_colors.dart';
import 'package:amonyatest/src/screens/profile/bloc/profiledata_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfiledataBloc, ProfiledataState>(
        builder: (context, state) {
      if (state is ProfileLoading) {
        return CupertinoActivityIndicator();
      }
      if (state is ProfileLoad) {
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
                      CupertinoIcons.profile_circled,
                      size: 74,
                      color: CupertinoColors.black,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(state.userModel.nickname ?? '',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: CupertinoColors.black)),
                  SizedBox(height: 12),
                  Text(
                    state.userModel.email,
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
                      padding:
                          const EdgeInsets.only(top: 21, left: 29, bottom: 22),
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
      } else if (state is ProfileFailed) {
        Text('Ошибка');
      }

      return Container();
    });
  }
}
