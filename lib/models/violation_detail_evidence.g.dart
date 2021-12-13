// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_detail_evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationDetailEvidence _$ViolationDetailEvidenceFromJson(
        Map<String, dynamic> json) =>
    ViolationDetailEvidence(
      evidenceId: json['evidenceId'] as String,
      staff: AccountAlternative.fromJson(json['staff'] as Map<String, dynamic>),
      evidenceImages: (json['evidenceImages'] as List<dynamic>)
          .map((e) => EvidenceImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViolationDetailEvidenceToJson(
        ViolationDetailEvidence instance) =>
    <String, dynamic>{
      'evidenceId': instance.evidenceId,
      'staff': instance.staff,
      'evidenceImages': instance.evidenceImages,
    };
