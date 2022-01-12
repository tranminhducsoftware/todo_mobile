import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/auth/authenticate_model.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/screens/splash/bloc/splash_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SplashBloc _splashBloc;
  final IAccountRepository _accountRepository =
      GetIt.I.get<IAccountRepository>();

  LoginBloc(
    SplashBloc splashBloc,
  )   : _splashBloc = splashBloc,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
  }

  Stream<LoginState> _mapLoginWithEmailToState(LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      _accountRepository.authenticateModel = AuthenticateModel(
          userNameOrEmailAddress: event.email,
          password: event.password,
          rememberClient: false);
      await _accountRepository.loginUser();
      _splashBloc.add(NavigateToHomeScreenEvent());
      yield LoginSuccess();
      yield LoginInitial();
    } catch (error) {
      yield LoginFailure(error: 'Something very weird just happened');
    }
  }
}
