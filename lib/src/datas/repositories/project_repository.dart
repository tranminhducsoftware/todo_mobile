import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/project/Dto/project_step_query.dart';
import 'package:todo_mobile/src/datas/models/project/project_info.dart';
import 'package:todo_mobile/src/datas/models/project/project_step_info.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/project_provider.dart';
import 'interfaces/project_repository.dart';

class ProjectRepository implements IProjectRepository {
  IProjectProvider? projectProvider;

  ProjectRepository({this.projectProvider}) {
    var getIt = GetIt.I;
    projectProvider = getIt.get<IProjectProvider>();
  }

  @override
  Future<List<ProjectInfo>> GetProjectInfos() async {
    return await projectProvider!.GetProjectInfos();
  }

  @override
  Future<List<ProjectStepInfo>> GetProjectStepInfos(
      ProjectStepInputQuery input) async {
    return await projectProvider!.GetProjectStepInfos(input);
  }
}
