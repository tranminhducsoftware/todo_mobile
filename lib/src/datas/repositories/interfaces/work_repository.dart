import 'package:todo_mobile/src/datas/models/work/work_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_input_query.dart';

abstract class IWorkRepository {
  Future<List<WorkInfo>> GetWorkInfos(WorkInputQuery input);
}
