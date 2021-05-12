import 'dart:async';

import 'package:bkdschool/data/models/UserModel.dart';
import 'package:bkdschool/data/repos/FireRepo.dart';
import 'package:bkdschool/data/repos/UserRepo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _repo;
  UserBloc(this._repo) : super(UserStateLoading());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    try {
      //main
      if (event is UserRepoInit) {
        yield UserStateLoading();
        FireRepo.instance.init();
        bool loggedin = await _repo.isLoggedIn();
        if (loggedin) {
          final isAdmin = await _repo.isAdminUser();
          if (isAdmin)
            yield UserStateAdmin();
          else
            yield UserStateAuthenticated();
        } else {
          yield UserStateNotAuthenticated();
        }
      }
      //
      if (event is UserEventLoginWithUsername) {
        yield UserStateLoading();
        if (await _repo.logInWithUsername(event.username, event.password)) {
          final isAdmin = await _repo.isAdminUser();
          if (isAdmin)
            yield UserStateAdmin();
          else
            yield UserStateAuthenticated();
        } else
          yield* throwErrorState("Cannot Log in with Email");
      }
      //
      if (event is UserEventLogOut) {
        yield UserStateLoading();
        await _repo.signOut();
        yield UserStateNotAuthenticated();
      }
    } catch (e) {
      yield* throwErrorState(e.toString());
    }
  }

  Stream<UserState> throwErrorState(String message) async* {
    yield UserStateError(message);
    await Future.delayed(Duration(seconds: 2));
    yield UserStateNotAuthenticated();
  }
}
