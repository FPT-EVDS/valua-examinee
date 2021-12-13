// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Violation _$ViolationFromJson(Map<String, dynamic> json) => Violation(
      violationId: json['violationId'] as String,
      violator:
          AccountAlternative.fromJson(json['violator'] as Map<String, dynamic>),
      evidence: Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
      description: json['description'] as String,
      status: json['status'] as int,
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$ViolationToJson(Violation instance) => <String, dynamic>{
      'violationId': instance.violationId,
      'violator': instance.violator,
      'evidence': instance.evidence,
      'description': instance.description,
      'status': instance.status,
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };
