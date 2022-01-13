import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_mobile/src/datas/models/project/project_info.dart';
import 'package:todo_mobile/src/datas/repositories/interfaces/project_repository.dart';

part 'project_state.dart';

part 'project_event.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(Initial());

  final IProjectRepository _projectRepository = GetIt.I.get<IProjectRepository>();

  @override
  Stream<ProjectState> mapEventToState(ProjectEvent event) async* {
    if (event is GetProjects) {
      yield Loading();
      final data = await _projectRepository.GetProjectInfos();
      yield LoadedProjects(projects: data);
    }
  }
}
