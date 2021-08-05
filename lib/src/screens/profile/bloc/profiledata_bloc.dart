import 'dart:async';

import 'package:amonyatest/src/common/models/users_models.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'profiledata_event.dart';
part 'profiledata_state.dart';

class ProfiledataBloc extends Bloc<ProfiledataEvent, ProfiledataState> {
  ProfiledataBloc() : super(ProfiledataInitial());
  Box tokensBox = Hive.box('tokens');

  @override
  Stream<ProfiledataState> mapEventToState(
    ProfiledataEvent event,
  ) async* {
    if (event is InitialProfileEvent) {
      yield ProfileLoading();
      {
        // try {
        Dio dioProfile = Dio();
        // ignore: unused_local_variable
        Response responseProfile = await dioProfile.get(
          'http://api.codeunion.kz/api/v1/auth/login/profile',
          options: Options(
            headers: {
              'Authorization': 'Bearer ${tokensBox.get('access')}',
            },
          ),
        );
        print(responseProfile.data);
        UserModel modelUser = UserModel.fromJson(responseProfile.data);

        yield ProfileLoad(modelUser);
        // } on DioError catch (e) {
        //   yield ProfileFailed(message: 'данные не загрузились');
        //   throw e;
        // } catch (e) {
        //   yield ProfileFailed(message: 'Произошла ошибка');
        //   throw e;
        // }
      }
    }
  }
}
