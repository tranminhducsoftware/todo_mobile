import 'package:todo_mobile/src/constants/api_path.dart';
import 'package:todo_mobile/src/datas/models/work/work_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_input_query.dart';
import 'package:todo_mobile/src/utils/http_client_service.dart';

import 'interfaces/work_provider.dart';

class WorkProvider implements IWorkProvider {
  @override
  Future<List<WorkInfo>> GetWorkInfos(WorkInputQuery input) async {
    try {
      var httpClient = await HttpClientService().createClient();
      var clientResponse = await httpClient.get(ApiPath.work+"?projectId="+input.projectId.toString()+"&year="+input.year.toString());
      var workInfos = <WorkInfo>[];
      for (var work in clientResponse.data["result"]["items"]) {
        var workConvert = WorkInfo.fromJson(work["work"]);
        workInfos.add(workConvert);
      }
      return workInfos;
    } catch (e) {
      throw e;
    }
  }
}
