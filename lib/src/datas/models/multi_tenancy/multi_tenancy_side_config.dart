import 'package:json_annotation/json_annotation.dart';
import 'package:todo_mobile/src/constants/app_enums.dart';
part 'multi_tenancy_side_config.g.dart';

@JsonSerializable()
class MultiTenancySideConfig {
  MultiTenancySides? host;
  MultiTenancySides? tenant;
  MultiTenancySideConfig({this.host, this.tenant});

  factory MultiTenancySideConfig.fromJson(Map<String, dynamic> json) =>
      _$MultiTenancySideConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MultiTenancySideConfigToJson(this);
}
