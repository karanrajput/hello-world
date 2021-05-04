part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserStateLoading extends UserState {}

//
//Basic Authentication
//
class UserStateNotAuthenticated extends UserState {}

class UserStateAuthenticated extends UserState {}

class UserStateAdmin extends UserState {}

class UserStateError extends UserState {
  final String message;

  UserStateError(this.message);
}
