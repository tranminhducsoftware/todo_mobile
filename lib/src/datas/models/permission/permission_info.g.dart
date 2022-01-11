// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionInfo _$PermissionInfoFromJson(Map<String, dynamic> json) =>
    PermissionInfo(
      json['parentName'] as String?,
      json['name'] as String?,
      json['displayName'] as String?,
      json['description'] as String?,
      json['isGrantedByDefault'] as bool,
    );

Map<String, dynamic> _$PermissionInfoToJson(PermissionInfo instance) =>
    <String, dynamic>{
      'parentName': instance.parentName,
      'name': instance.name,
      'displayName': instance.displayName,
      'description': instance.description,
      'isGrantedByDefault': instance.isGrantedByDefault,
    };
