part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class RegisterPress extends RegisterEvent {
  final String email;
  final String password;
  final String phoneNumber;
  final String nickName;

  RegisterPress(
      {required this.email,
      required this.password,
      required this.phoneNumber,
      required this.nickName});
}
