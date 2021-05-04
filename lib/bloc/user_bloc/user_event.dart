part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

//Init
class UserRepoInit extends UserEvent {}

//
//Basic Auth
//
class UserEventLoginWithGoogle extends UserEvent {}

class UserEventLoginWithUsername extends UserEvent {
  final String username;
  final String password;
  UserEventLoginWithUsername(this.username, this.password);
}

class UserEventLoginWithAnony extends UserEvent {}

class UserEventLogOut extends UserEvent {}
