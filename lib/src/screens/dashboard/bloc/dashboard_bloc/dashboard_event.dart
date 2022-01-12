
part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class LoadInformationUser extends DashboardEvent {}


class LoadAggregateData extends DashboardEvent {}