import 'package:json_annotation/json_annotation.dart';

part 'select_item.g.dart';

@JsonSerializable()
class SelectItemInfo {
  String? text;

  String? value;

  SelectItemInfo(this.text, this.value);

  factory SelectItemInfo.fromJson(Map<String, dynamic> json) =>
      _$SelectItemInfoFromJson(json);

  Map<String, dynamic> toJson() => _$SelectItemInfoToJson(this);
}