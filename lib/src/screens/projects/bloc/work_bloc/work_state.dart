part of 'work_bloc.dart';

@immutable
abstract class WorkState {}


class Initial extends WorkState {}

class Loading extends WorkState {}

class LoadedWorks extends WorkState {
  final List<WorkInfo> works;
  final List<ProjectStepInfo> projectSteps;

  LoadedWorks({ required this.works, required this.projectSteps});
}