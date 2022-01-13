import 'package:json_annotation/json_annotation.dart';

part 'project_info.g.dart';

@JsonSerializable()
class ProjectInfo {
  int id;
  int? tenantId;
  String code;
  String name;
  String description;
  DateTime fromDate;
  DateTime toDate;

  int? mainAssignId;
  String mainAssignName;
  String mainAssignCode;
  String mainAssignAvatar;
  String mainAssignEmail;
  String mainAssignDepartment;

  String mainAssignPosition;
  double warningDay;
  int status;
  int statusTime;
  int workDone;
  int workDoing;
  String color;
  String note;
  int totalEmployee;
  double? creatorUserId;

  ProjectInfo(
      this.id,
      this.tenantId,
      this.code,
      this.name,
      this.description,
      this.fromDate,
      this.toDate,
      this.mainAssignId,
      this.mainAssignName,
      this.mainAssignCode,
      this.mainAssignAvatar,
      this.mainAssignEmail,
      this.mainAssignDepartment,
      this.mainAssignPosition,
      this.warningDay,
      this.status,
      this.statusTime,
      this.workDone,
      this.workDoing,
      this.color,
      this.note,
      this.totalEmployee,
      this.creatorUserId
      );

  factory ProjectInfo.fromJson(Map<String, dynamic> json) =>
      _$ProjectInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectInfoToJson(this);
}
