
part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class Initial extends SplashState {}

class Loading extends SplashState {}

class LoadedToLogin extends SplashState {

}

class LoadedToDashboard extends SplashState {

}