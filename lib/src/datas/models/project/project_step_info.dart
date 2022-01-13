import 'package:json_annotation/json_annotation.dart';

part 'project_step_info.g.dart';

@JsonSerializable()
class ProjectStepInfo {
  int id;
  int? tenantId;
  String? code;
  String? name;
  String? note;
  int? projectId;
  String? projectName;
  String? projectCode;

  int? workStepId;
  String? workStepName;
  String? workStepCode;
  String? workStepColor;

  ProjectStepInfo(
    this.id,
    this.tenantId,
    this.code,
    this.name,
    this.note,
    this.projectId,
    this.projectName,
    this.projectCode,
    this.workStepId,
    this.workStepName,
    this.workStepCode,
    this.workStepColor,
  );

  factory ProjectStepInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectStepInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectStepInfoToJson(this);
}
