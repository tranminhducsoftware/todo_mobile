import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';

part 'splash_event.dart';

part 'splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(Initial());
  IAccountRepository accountRepository = GetIt.I.get<IAccountRepository>();

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is NavigateToHomeOrLoginScreenEvent) {
      yield Loading();

      // During the Loading state we can do additional checks like,
      // if the internet connection is available or not etc..

      await Future.delayed(const Duration(seconds: 1));
      final bool hasToken = await accountRepository.isUserLoggedIn();
      if (hasToken) {
        yield LoadedToDashboard(); // In this state we can load the HOME PAGE
      }else{
        yield LoadedToLogin(); // In this
      }

    }
    if (event is NavigateToHomeScreenEvent) {
      yield LoadedToDashboard();
    }
  }
}
