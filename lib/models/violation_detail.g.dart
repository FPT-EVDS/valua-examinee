// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationDetail _$ViolationDetailFromJson(Map<String, dynamic> json) =>
    ViolationDetail(
      violationId: json['violationId'] as String,
      violator:
          AccountAlternative.fromJson(json['violator'] as Map<String, dynamic>),
      evidence: ViolationDetailEvidence.fromJson(
          json['evidence'] as Map<String, dynamic>),
      description: json['description'] as String,
      status: $enumDecode(_$ViolationStatusEnumMap, json['status']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$ViolationDetailToJson(ViolationDetail instance) =>
    <String, dynamic>{
      'violationId': instance.violationId,
      'violator': instance.violator,
      'evidence': instance.evidence,
      'description': instance.description,
      'status': _$ViolationStatusEnumMap[instance.status],
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };

const _$ViolationStatusEnumMap = {
  ViolationStatus.inactive: 0,
  ViolationStatus.pending: 1,
  ViolationStatus.confirmed: 2,
  ViolationStatus.rejected: 3,
};

ViolationDetailEvidence _$ViolationDetailEvidenceFromJson(
        Map<String, dynamic> json) =>
    ViolationDetailEvidence(
      evidenceId: json['evidenceId'] as String,
      staff: AccountAlternative.fromJson(json['staff'] as Map<String, dynamic>),
      examRoom: ExamRoom.fromJson(json['examRoom'] as Map<String, dynamic>),
      evidenceImages: (json['evidenceImages'] as List<dynamic>)
          .map((e) => EvidenceImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ViolationDetailEvidenceToJson(
        ViolationDetailEvidence instance) =>
    <String, dynamic>{
      'evidenceId': instance.evidenceId,
      'staff': instance.staff,
      'examRoom': instance.examRoom,
      'evidenceImages': instance.evidenceImages,
    };
