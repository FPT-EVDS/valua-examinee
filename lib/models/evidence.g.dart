// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Evidence _$EvidenceFromJson(Map<String, dynamic> json) => Evidence(
      evidenceId: json['evidenceId'] as String,
      staff: json['staff'] == null
          ? null
          : AccountAlternative.fromJson(json['staff'] as Map<String, dynamic>),
      examRoom: ExamRoom.fromJson(json['examRoom'] as Map<String, dynamic>),
      evidenceImages: (json['evidenceImages'] as List<dynamic>?)
          ?.map((e) => EvidenceImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EvidenceToJson(Evidence instance) => <String, dynamic>{
      'evidenceId': instance.evidenceId,
      'staff': instance.staff,
      'examRoom': instance.examRoom,
      'evidenceImages': instance.evidenceImages,
    };