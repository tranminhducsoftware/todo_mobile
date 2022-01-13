import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/dashboard/aggregate_data.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/dashboard_repository.dart';

part 'overview_state.dart';

part 'overview_event.dart';

class OverviewBloc extends Bloc<OverviewEvent, OverviewState> {
  OverviewBloc() : super(InitialOverview());

  final IDashboardRepository _overviewRepository =
      GetIt.I.get<IDashboardRepository>();

  @override
  Stream<OverviewState> mapEventToState(OverviewEvent event) async* {
    if (event is LoadAggregateData) {
      yield LoadingOverview();
      final data = await _overviewRepository.GetInfoAggregateData();
      yield AggregateDatas(aggregateData: data);
    }
  }
}
