import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/project/Dto/project_step_query.dart';
import 'package:todo_mobile/src/datas/models/project/project_step_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_info.dart';
import 'package:todo_mobile/src/datas/models/work/work_input_query.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/project_repository.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/work_repository.dart';

part 'work_state.dart';

part 'work_event.dart';

class WorkBloc extends Bloc<WorkEvent, WorkState> {
  WorkBloc() : super(Initial());

  final IWorkRepository _workRepository = GetIt.I.get<IWorkRepository>();
  final IProjectRepository _projectRepository = GetIt.I.get<IProjectRepository>();

  @override
  Stream<WorkState> mapEventToState(WorkEvent event) async* {
    if (event is GetWorks) {
      yield Loading();
      final works = await _workRepository.GetWorkInfos(event.input);
      final projectSteps = await _projectRepository.GetProjectStepInfos(ProjectStepInputQuery(event.input.projectId));
      yield LoadedWorks(works: works,  projectSteps: projectSteps);
    }
  }
}
