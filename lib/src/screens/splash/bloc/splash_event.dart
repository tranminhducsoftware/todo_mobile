part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class NavigateToHomeOrLoginScreenEvent extends SplashEvent {}

class NavigateToHomeScreenEvent extends SplashEvent {}

