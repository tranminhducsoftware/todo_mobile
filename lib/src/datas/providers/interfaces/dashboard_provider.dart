import 'package:todo_mobile/src/datas/models/dashboard/aggregate_data.dart';

abstract class IDashboardProvider {
  Future<AggregateData> GetInfoAggregateData();
}