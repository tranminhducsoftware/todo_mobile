// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multi_tenancy_side_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MultiTenancySideConfig _$MultiTenancySideConfigFromJson(
        Map<String, dynamic> json) =>
    MultiTenancySideConfig(
      host: $enumDecodeNullable(_$MultiTenancySidesEnumMap, json['host']),
      tenant: $enumDecodeNullable(_$MultiTenancySidesEnumMap, json['tenant']),
    );

Map<String, dynamic> _$MultiTenancySideConfigToJson(
        MultiTenancySideConfig instance) =>
    <String, dynamic>{
      'host': _$MultiTenancySidesEnumMap[instance.host],
      'tenant': _$MultiTenancySidesEnumMap[instance.tenant],
    };

const _$MultiTenancySidesEnumMap = {
  MultiTenancySides.none: 'none',
  MultiTenancySides.tenant: 'tenant',
  MultiTenancySides.host: 'host',
};
