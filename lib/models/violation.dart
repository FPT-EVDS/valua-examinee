import 'package:evds_examinee/enums/violation_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/evidence.dart';
import 'package:json_annotation/json_annotation.dart';
part 'violation.g.dart';

@JsonSerializable()
class Violation {
  String violationId;
  String? thumbnailUrl;
  Evidence evidence;
  String? description;
  ViolationStatus status;
  DateTime createdDate;
  DateTime lastModifiedDate;

  Violation({
    required this.violationId,
    this.thumbnailUrl,
    required this.evidence,
    this.description,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory Violation.fromJson(Map<String, dynamic> json) =>
      _$ViolationFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationToJson(this);
}
