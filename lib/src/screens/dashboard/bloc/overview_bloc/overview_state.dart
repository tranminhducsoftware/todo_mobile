part of 'overview_bloc.dart';

@immutable
abstract class OverviewState {}


class InitialOverview extends OverviewState {}

class LoadingOverview extends OverviewState {}

class AggregateDatas extends OverviewState {
  final AggregateData aggregateData;

  AggregateDatas({ required this.aggregateData});
}