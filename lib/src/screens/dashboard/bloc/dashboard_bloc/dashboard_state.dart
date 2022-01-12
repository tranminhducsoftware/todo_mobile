part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {}

class Initial extends DashboardState {}

class Loading extends DashboardState {}

class InformationUser extends DashboardState {
  final LoginInformations? loginInformations;

  InformationUser({this.loginInformations});
}

class AggregateDatas extends DashboardState {
  final AggregateData aggregateData;

  AggregateDatas({ required this.aggregateData});
}