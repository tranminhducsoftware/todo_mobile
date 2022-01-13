

import 'package:todo_mobile/src/datas/models/project/Dto/project_step_query.dart';
import 'package:todo_mobile/src/datas/models/project/project_info.dart';
import 'package:todo_mobile/src/datas/models/project/project_step_info.dart';

abstract class IProjectProvider {
  Future<List<ProjectInfo>> GetProjectInfos();

  Future<List<ProjectStepInfo>> GetProjectStepInfos(ProjectStepInputQuery input);
}