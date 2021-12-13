import 'package:evds_examinee/enums/violation_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/violation_detail_evidence.dart';
import 'package:json_annotation/json_annotation.dart';

part 'violation_detail.g.dart';

@JsonSerializable()
class ViolationDetail {
  String violationId;
  AccountAlternative violator;
  ViolationDetailEvidence evidence;
  String description;
  ViolationStatus status;
  DateTime createdDate;
  DateTime lastModifiedDate;

  ViolationDetail({
    required this.violationId,
    required this.violator,
    required this.evidence,
    required this.description,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory ViolationDetail.fromJson(Map<String, dynamic> json) =>
      _$ViolationDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationDetailToJson(this);
}
