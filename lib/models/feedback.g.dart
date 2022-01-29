// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Feedback _$FeedbackFromJson(Map<String, dynamic> json) => Feedback(
      feedbackId: json['feedbackId'] as String,
      examinee:
          AccountAlternative.fromJson(json['examinee'] as Map<String, dynamic>),
      shiftManager: AccountAlternative.fromJson(
          json['shiftManager'] as Map<String, dynamic>),
      violation:
          FeedbackViolation.fromJson(json['violation'] as Map<String, dynamic>),
      status: $enumDecode(_$FeedbackStatusEnumMap, json['status']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'feedbackId': instance.feedbackId,
      'examinee': instance.examinee,
      'shiftManager': instance.shiftManager,
      'violation': instance.violation,
      'status': _$FeedbackStatusEnumMap[instance.status],
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.inactive: 0,
  FeedbackStatus.pending: 1,
  FeedbackStatus.resolved: 2,
};

FeedbackViolation _$FeedbackViolationFromJson(Map<String, dynamic> json) =>
    FeedbackViolation(
      violationId: json['violationId'] as String,
      evidence:
          FeedbackEvidence.fromJson(json['evidence'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackViolationToJson(FeedbackViolation instance) =>
    <String, dynamic>{
      'violationId': instance.violationId,
      'evidence': instance.evidence,
    };

FeedbackEvidence _$FeedbackEvidenceFromJson(Map<String, dynamic> json) =>
    FeedbackEvidence(
      evidenceId: json['evidenceId'] as String,
      examRoom:
          EvidenceExamRoom.fromJson(json['examRoom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeedbackEvidenceToJson(FeedbackEvidence instance) =>
    <String, dynamic>{
      'evidenceId': instance.evidenceId,
      'examRoom': instance.examRoom,
    };

EvidenceExamRoom _$EvidenceExamRoomFromJson(Map<String, dynamic> json) =>
    EvidenceExamRoom(
      examRoomId: json['examRoomId'] as String,
      examRoomName: json['examRoomName'] as String,
    );

Map<String, dynamic> _$EvidenceExamRoomToJson(EvidenceExamRoom instance) =>
    <String, dynamic>{
      'examRoomId': instance.examRoomId,
      'examRoomName': instance.examRoomName,
    };
