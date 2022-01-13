import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/work/work_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_input_query.dart';
import 'package:todo_mobile/src/datas/providers/interfaces/work_provider.dart';

import 'interfaces/work_repository.dart';

class WorkRepository implements IWorkRepository {
  IWorkProvider? workProvider;

  WorkRepository({this.workProvider}) {
    var getIt = GetIt.I;
    workProvider = getIt.get<IWorkProvider>();
  }

  @override
  Future<List<WorkInfo>> GetWorkInfos(WorkInputQuery input) async {
    return await workProvider!.GetWorkInfos(input);
  }
}
