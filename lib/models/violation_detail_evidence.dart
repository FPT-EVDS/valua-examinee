import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/evidence_image.dart';
import 'package:json_annotation/json_annotation.dart';
part 'violation_detail_evidence.g.dart';

@JsonSerializable()
class ViolationDetailEvidence {
  String evidenceId;
  AccountAlternative staff;
  List<EvidenceImage> evidenceImages;

  ViolationDetailEvidence({
    required this.evidenceId,
    required this.staff,
    required this.evidenceImages,
  });

  factory ViolationDetailEvidence.fromJson(Map<String, dynamic> json) =>
      _$ViolationDetailEvidenceFromJson(json);

  Map<String, dynamic> toJson() => _$ViolationDetailEvidenceToJson(this);
}
