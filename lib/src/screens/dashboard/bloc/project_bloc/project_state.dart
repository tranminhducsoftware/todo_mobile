part of 'project_bloc.dart';

@immutable
abstract class ProjectState {}


class Initial extends ProjectState {}

class Loading extends ProjectState {}

class LoadedProjects extends ProjectState {
  final List<ProjectInfo> projects;

  LoadedProjects({ required this.projects});
}