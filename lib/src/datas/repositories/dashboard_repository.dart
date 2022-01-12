import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/dashboard/aggregate_data.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/dashboard_provider.dart';

import 'interfaces/dashboard_repository.dart';

class DashboardRepository implements IDashboardRepository {
  IDashboardProvider? dashboardProvider;

  DashboardRepository({this.dashboardProvider}) {
    var getIt = GetIt.I;
    dashboardProvider = getIt.get<IDashboardProvider>();
  }

  @override
  Future<AggregateData> GetInfoAggregateData() async {
    return await dashboardProvider!.GetInfoAggregateData();
  }
}
