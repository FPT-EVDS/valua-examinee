import 'package:evds_examinee/models/violation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'violation_list.g.dart';

@JsonSerializable()
class ViolationList {
  int totalItems;
  List<Violation> violations;
  int totalPages;
  int currentPage;

  ViolationList({
    required this.totalItems,
    required this.violations,
    required this.totalPages,
    required this.currentPage,
  });

  factory ViolationList.fromJson(Map<String, dynamic> json) =>
      _$ViolationListFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationListToJson(this);
}
