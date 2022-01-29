// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EvidenceImage _$EvidenceImageFromJson(Map<String, dynamic> json) =>
    EvidenceImage(
      evidenceImageId: json['evidenceImageId'] as String,
      imageUrl: json['imageUrl'] as String,
      recordedAt: DateTime.parse(json['recordedAt'] as String),
    );

Map<String, dynamic> _$EvidenceImageToJson(EvidenceImage instance) =>
    <String, dynamic>{
      'evidenceImageId': instance.evidenceImageId,
      'imageUrl': instance.imageUrl,
      'recordedAt': instance.recordedAt.toIso8601String(),
    };
