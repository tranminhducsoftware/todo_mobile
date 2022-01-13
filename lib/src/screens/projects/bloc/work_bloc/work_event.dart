part of 'work_bloc.dart';

@immutable
abstract class WorkEvent {}

class GetWorks extends WorkEvent {
  WorkInputQuery input;

  GetWorks(this.input);
}
