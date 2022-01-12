import 'package:todo_mobile/src/constants/api_path.dart';
import 'package:todo_mobile/src/datas/models/common/ajax_response.dart';
import 'package:todo_mobile/src/datas/models/dashboard/aggregate_data.dart';
import 'package:todo_mobile/src/utils/http_client_service.dart';

import 'interfaces/dashboard_provider.dart';

class DashboardProvider implements IDashboardProvider {
  @override
  Future<AggregateData> GetInfoAggregateData() async {
    var httpClient = await HttpClientService().createClient();
    var clientResponse = await httpClient.get(ApiPath.mapSheetGetAll);
    var ajaxResponse = AjaxResponse<AggregateData>.fromJson(clientResponse.data,
        (data) => AggregateData.fromJson((data as Map<String, dynamic>)));
    return ajaxResponse.result!;
  }
}
