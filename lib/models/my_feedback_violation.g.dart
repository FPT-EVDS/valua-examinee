// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_feedback_violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFeedbackViolation _$MyFeedbackViolationFromJson(Map<String, dynamic> json) =>
    MyFeedbackViolation(
      violationId: json['violationId'] as String,
      examRoom: json['examRoom'] == null
          ? null
          : ExamRoom.fromJson(json['examRoom'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MyFeedbackViolationToJson(
        MyFeedbackViolation instance) =>
    <String, dynamic>{
      'violationId': instance.violationId,
      'examRoom': instance.examRoom,
    };
