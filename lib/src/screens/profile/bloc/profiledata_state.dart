part of 'profiledata_bloc.dart';

@immutable
abstract class ProfiledataState {}

class ProfiledataInitial extends ProfiledataState {}

class ProfileLoading extends ProfiledataState {}

class ProfileLoad extends ProfiledataState {
  final UserModel userModel;

  ProfileLoad(this.userModel);
}

class ProfileFailed extends ProfiledataState {
  final String? message;

  ProfileFailed({required this.message});
}
