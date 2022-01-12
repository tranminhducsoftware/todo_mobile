import 'package:json_annotation/json_annotation.dart';

part 'aggregate_data.g.dart';

@JsonSerializable()
class AggregateData {
  int totalEmployees;
  int totalWorkDepartment;
  int totalProject;
  int totalProjectNew;
  int totalProjectDoing;
  int totalProjectOver;

  AggregateData(
      this.totalEmployees,
      this.totalWorkDepartment,
      this.totalProject,
      this.totalProjectNew,
      this.totalProjectDoing,
      this.totalProjectOver);

  factory AggregateData.fromJson(Map<String, dynamic> json) =>
      _$AggregateDataFromJson(json);

  Map<String, dynamic> toJson() => _$AggregateDataToJson(this);

}
