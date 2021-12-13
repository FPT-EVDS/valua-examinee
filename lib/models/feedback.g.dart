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
      violation: Violation.fromJson(json['violation'] as Map<String, dynamic>),
      content: json['content'] as String,
      reply: json['reply'] as String?,
      status: $enumDecode(_$FeedbackStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$FeedbackToJson(Feedback instance) => <String, dynamic>{
      'feedbackId': instance.feedbackId,
      'examinee': instance.examinee,
      'shiftManager': instance.shiftManager,
      'violation': instance.violation,
      'content': instance.content,
      'reply': instance.reply,
      'status': _$FeedbackStatusEnumMap[instance.status],
    };

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.inactive: 0,
  FeedbackStatus.pending: 1,
  FeedbackStatus.resolved: 2,
};
