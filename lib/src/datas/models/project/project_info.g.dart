// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectInfo _$ProjectInfoFromJson(Map<String, dynamic> json) => ProjectInfo(
      json['id'] as int,
      json['tenantId'] as int?,
      json['code'] as String,
      json['name'] as String,
      json['description'] as String,
      DateTime.parse(json['fromDate'] as String),
      DateTime.parse(json['toDate'] as String),
      json['mainAssignId'] as int?,
      json['mainAssignName'] as String,
      json['mainAssignCode'] as String,
      json['mainAssignAvatar'] as String,
      json['mainAssignEmail'] as String,
      json['mainAssignDepartment'] as String,
      json['mainAssignPosition'] as String,
      (json['warningDay'] as num).toDouble(),
      json['status'] as int,
      json['statusTime'] as int,
      json['workDone'] as int,
      json['workDoing'] as int,
      json['color'] as String,
      json['note'] as String,
      json['totalEmployee'] as int,
      (json['creatorUserId'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProjectInfoToJson(ProjectInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'fromDate': instance.fromDate.toIso8601String(),
      'toDate': instance.toDate.toIso8601String(),
      'mainAssignId': instance.mainAssignId,
      'mainAssignName': instance.mainAssignName,
      'mainAssignCode': instance.mainAssignCode,
      'mainAssignAvatar': instance.mainAssignAvatar,
      'mainAssignEmail': instance.mainAssignEmail,
      'mainAssignDepartment': instance.mainAssignDepartment,
      'mainAssignPosition': instance.mainAssignPosition,
      'warningDay': instance.warningDay,
      'status': instance.status,
      'statusTime': instance.statusTime,
      'workDone': instance.workDone,
      'workDoing': instance.workDoing,
      'color': instance.color,
      'note': instance.note,
      'totalEmployee': instance.totalEmployee,
      'creatorUserId': instance.creatorUserId,
    };
