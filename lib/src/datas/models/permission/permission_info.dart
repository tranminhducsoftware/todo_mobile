import 'package:json_annotation/json_annotation.dart';
part 'permission_info.g.dart';
@JsonSerializable()
class PermissionInfo {
  String? parentName;

  String? name;

  String? displayName;

  String? description;

  bool isGrantedByDefault;

  PermissionInfo(this.parentName, this.name, this.displayName,
      this.description, this.isGrantedByDefault);

  factory PermissionInfo.fromJson(Map<String, dynamic> json) =>
      _$PermissionInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionInfoToJson(this);
}
