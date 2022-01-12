import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/auth/login_informations.dart';
import 'package:todo_mobile/src/datas/models/dashboard/aggregate_data.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/account_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/dashboard_repository.dart';

part 'dashboard_state.dart';

part 'dashboard_event.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(Initial());

  final IAccountRepository _accountRepository =
      GetIt.I.get<IAccountRepository>();

  final IDashboardRepository _dashboardRepository =
  GetIt.I.get<IDashboardRepository>();

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is LoadInformationUser) {
      yield Loading();
      final data = await _accountRepository.getInformationUser();
      yield InformationUser(loginInformations: data);
    }

    if (event is LoadAggregateData) {
      yield Loading();
      final data = await _dashboardRepository.GetInfoAggregateData();
      yield AggregateDatas(aggregateData:  data);
    }
  }
}
