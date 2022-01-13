// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_step_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectStepInfo _$ProjectStepInfoFromJson(Map<String, dynamic> json) =>
    ProjectStepInfo(
      json['id'] as int,
      json['tenantId'] as int?,
      json['code'] as String?,
      json['name'] as String?,
      json['note'] as String?,
      json['projectId'] as int?,
      json['projectName'] as String?,
      json['projectCode'] as String?,
      json['workStepId'] as int?,
      json['workStepName'] as String?,
      json['workStepCode'] as String?,
      json['workStepColor'] as String?,
    );

Map<String, dynamic> _$ProjectStepInfoToJson(ProjectStepInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'code': instance.code,
      'name': instance.name,
      'note': instance.note,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'projectCode': instance.projectCode,
      'workStepId': instance.workStepId,
      'workStepName': instance.workStepName,
      'workStepCode': instance.workStepCode,
      'workStepColor': instance.workStepColor,
    };
