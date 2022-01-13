import 'package:json_annotation/json_annotation.dart';

part 'work_info.g.dart';

@JsonSerializable()
class WorkInfo {
  int? id;
  int? tenantId;
  String? code;
  String? name;
  String? description;
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? toRealDate;
  DateTime? warningDate;
  String? colorName;

  int? mainAssignId;
  String? mainAssignName;
  String? mainAssignCode;
  String? mainAssignAvatar;
  String? mainAssignEmail;
  String? mainAssignDepartment;

  int? projectStepId;
  String? projectStepName;
  String? projectStepColor;

  int? workAssignorId;
  int? workAssignorUserId;
  String? workAssignorName;

  String? workAssignorAvatar;
  String? workAssignorWorkPositionName;
  String? workAssignorWorkDepartmentName;

  int? workerParentId;
  String? workerParentName;
  int? status;
  int? statusTime;
  int? order;
  int? totalWorkAttachedFile;
  int? totalWorkChat;
  DateTime? createTime;
  int? createUserId;
  String? projectName;
  String? projectCode;
  DateTime? projectToDate;
  DateTime? projectFromDate;
  int? projectId;
  int? userId;

  WorkInfo(
    this.id,
    this.tenantId,
    this.code,
    this.name,
    this.description,
    this.fromDate,
    this.toDate,
    this.toRealDate,
    this.warningDate,
    this.colorName,
    this.mainAssignId,
    this.mainAssignName,
    this.mainAssignCode,
    this.mainAssignAvatar,
    this.mainAssignEmail,
    this.mainAssignDepartment,
    this.projectStepId,
    this.projectStepName,
    this.projectStepColor,
    this.workAssignorId,
    this.workAssignorUserId,
    this.workAssignorName,
    this.workAssignorAvatar,
    this.workAssignorWorkPositionName,
    this.workAssignorWorkDepartmentName,
    this.workerParentId,
    this.workerParentName,
    this.status,
    this.statusTime,
    this.order,
    this.totalWorkAttachedFile,
    this.totalWorkChat,
    this.createTime,
    this.createUserId,
    this.projectName,
    this.projectCode,
    this.projectToDate,
    this.projectFromDate,
    this.projectId,
    this.userId,
  );

  factory WorkInfo.fromJson(Map<String, dynamic> json) =>
      _$WorkInfoFromJson(json);

  Map<String, dynamic> toJson() => _$WorkInfoToJson(this);
}
