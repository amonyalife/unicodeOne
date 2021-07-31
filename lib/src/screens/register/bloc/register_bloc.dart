import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial());

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterPress) {
      yield RegisterLoading();
      {
        try {
          Dio dioRegister = Dio();

          // ignore: unused_local_variable
          Response response = await dioRegister.post(
              'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
              data: {
                'email': event.email,
                'password': event.password,
                "nickname": event.nickName,
                "phone": event.phoneNumber,
              });

          yield RegisterLoaded();
        } on DioError catch (e) {
          yield RegisterFailed(message: 'Неправильный логин или пароль');
          throw e;
        } catch (e) {
          yield RegisterFailed(message: 'Произошла ошибка');
          throw e;
        }
      }
    }
  }
}
