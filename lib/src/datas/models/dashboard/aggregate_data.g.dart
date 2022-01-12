// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aggregate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AggregateData _$AggregateDataFromJson(Map<String, dynamic> json) =>
    AggregateData(
      json['totalEmployees'] as int,
      json['totalWorkDepartment'] as int,
      json['totalProject'] as int,
      json['totalProjectNew'] as int,
      json['totalProjectDoing'] as int,
      json['totalProjectOver'] as int,
    );

Map<String, dynamic> _$AggregateDataToJson(AggregateData instance) =>
    <String, dynamic>{
      'totalEmployees': instance.totalEmployees,
      'totalWorkDepartment': instance.totalWorkDepartment,
      'totalProject': instance.totalProject,
      'totalProjectNew': instance.totalProjectNew,
      'totalProjectDoing': instance.totalProjectDoing,
      'totalProjectOver': instance.totalProjectOver,
    };
