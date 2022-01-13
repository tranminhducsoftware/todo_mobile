// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkInfo _$WorkInfoFromJson(Map<String, dynamic> json) => WorkInfo(
      json['id'] as int?,
      json['tenantId'] as int?,
      json['code'] as String?,
      json['name'] as String?,
      json['description'] as String?,
      json['fromDate'] == null
          ? null
          : DateTime.parse(json['fromDate'] as String),
      json['toDate'] == null ? null : DateTime.parse(json['toDate'] as String),
      json['toRealDate'] == null
          ? null
          : DateTime.parse(json['toRealDate'] as String),
      json['warningDate'] == null
          ? null
          : DateTime.parse(json['warningDate'] as String),
      json['colorName'] as String?,
      json['mainAssignId'] as int?,
      json['mainAssignName'] as String?,
      json['mainAssignCode'] as String?,
      json['mainAssignAvatar'] as String?,
      json['mainAssignEmail'] as String?,
      json['mainAssignDepartment'] as String?,
      json['projectStepId'] as int?,
      json['projectStepName'] as String?,
      json['projectStepColor'] as String?,
      json['workAssignorId'] as int?,
      json['workAssignorUserId'] as int?,
      json['workAssignorName'] as String?,
      json['workAssignorAvatar'] as String?,
      json['workAssignorWorkPositionName'] as String?,
      json['workAssignorWorkDepartmentName'] as String?,
      json['workerParentId'] as int?,
      json['workerParentName'] as String?,
      json['status'] as int?,
      json['statusTime'] as int?,
      json['order'] as int?,
      json['totalWorkAttachedFile'] as int?,
      json['totalWorkChat'] as int?,
      json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      json['createUserId'] as int?,
      json['projectName'] as String?,
      json['projectCode'] as String?,
      json['projectToDate'] == null
          ? null
          : DateTime.parse(json['projectToDate'] as String),
      json['projectFromDate'] == null
          ? null
          : DateTime.parse(json['projectFromDate'] as String),
      json['projectId'] as int?,
      json['userId'] as int?,
    );

Map<String, dynamic> _$WorkInfoToJson(WorkInfo instance) => <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'fromDate': instance.fromDate?.toIso8601String(),
      'toDate': instance.toDate?.toIso8601String(),
      'toRealDate': instance.toRealDate?.toIso8601String(),
      'warningDate': instance.warningDate?.toIso8601String(),
      'colorName': instance.colorName,
      'mainAssignId': instance.mainAssignId,
      'mainAssignName': instance.mainAssignName,
      'mainAssignCode': instance.mainAssignCode,
      'mainAssignAvatar': instance.mainAssignAvatar,
      'mainAssignEmail': instance.mainAssignEmail,
      'mainAssignDepartment': instance.mainAssignDepartment,
      'projectStepId': instance.projectStepId,
      'projectStepName': instance.projectStepName,
      'projectStepColor': instance.projectStepColor,
      'workAssignorId': instance.workAssignorId,
      'workAssignorUserId': instance.workAssignorUserId,
      'workAssignorName': instance.workAssignorName,
      'workAssignorAvatar': instance.workAssignorAvatar,
      'workAssignorWorkPositionName': instance.workAssignorWorkPositionName,
      'workAssignorWorkDepartmentName': instance.workAssignorWorkDepartmentName,
      'workerParentId': instance.workerParentId,
      'workerParentName': instance.workerParentName,
      'status': instance.status,
      'statusTime': instance.statusTime,
      'order': instance.order,
      'totalWorkAttachedFile': instance.totalWorkAttachedFile,
      'totalWorkChat': instance.totalWorkChat,
      'createTime': instance.createTime?.toIso8601String(),
      'createUserId': instance.createUserId,
      'projectName': instance.projectName,
      'projectCode': instance.projectCode,
      'projectToDate': instance.projectToDate?.toIso8601String(),
      'projectFromDate': instance.projectFromDate?.toIso8601String(),
      'projectId': instance.projectId,
      'userId': instance.userId,
    };
