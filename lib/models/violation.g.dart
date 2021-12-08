// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Violation _$ViolationFromJson(Map<String, dynamic> json) => Violation(
      violationId: json['violationId'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      evidence: Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
      description: json['description'] as String?,
      status: $enumDecode(_$ViolationStatusEnumMap, json['status']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$ViolationToJson(Violation instance) => <String, dynamic>{
      'violationId': instance.violationId,
      'thumbnailUrl': instance.thumbnailUrl,
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
