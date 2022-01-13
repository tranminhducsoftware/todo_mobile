import 'package:todo_mobile/src/constants/api_path.dart';
import 'package:todo_mobile/src/datas/models/common/ajax_response.dart';
import 'package:todo_mobile/src/datas/models/project/Dto/project_step_query.dart';
import 'package:todo_mobile/src/datas/models/project/project_info.dart';
import 'package:todo_mobile/src/datas/models/project/project_step_info.dart';
import 'package:todo_mobile/src/utils/http_client_service.dart';

import 'interfaces/project_provider.dart';

class ProjectProvider implements IProjectProvider {
  @override
  Future<List<ProjectInfo>> GetProjectInfos() async {
    try {
      var httpClient = await HttpClientService().createClient();
      var clientResponse = await httpClient.get(ApiPath.project);
      var projectInfos = <ProjectInfo>[];
      for (var land in clientResponse.data["result"]["items"]) {
        var projectConvert = ProjectInfo.fromJson(land["project"]);
        projectInfos.add(projectConvert);
      }

      return projectInfos;
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<List<ProjectStepInfo>> GetProjectStepInfos(ProjectStepInputQuery input) async {
    try {
      var httpClient = await HttpClientService().createClient();
      var clientResponse = await httpClient.get(ApiPath.projectStep+"?projectId="+input.projectId.toString());
      var projectStepInfos = <ProjectStepInfo>[];
      for (var projectStep in clientResponse.data["result"]["items"]) {
        var projectConvert =
            ProjectStepInfo.fromJson(projectStep["projectStep"]);
        projectStepInfos.add(projectConvert);
      }
      return projectStepInfos;
    } catch (e) {
      throw e;
    }
  }
}
