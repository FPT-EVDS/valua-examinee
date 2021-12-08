// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackDetail _$FeedbackDetailFromJson(Map<String, dynamic> json) =>
    FeedbackDetail(
      feedbackId: json['feedbackId'] as String,
      examinee:
          AccountAlternative.fromJson(json['examinee'] as Map<String, dynamic>),
      shiftManager: AccountAlternative.fromJson(
          json['shiftManager'] as Map<String, dynamic>),
      violation: Violation.fromJson(json['violation'] as Map<String, dynamic>),
      content: json['content'] as String,
      reply: json['reply'] as String?,
      status: $enumDecode(_$FeedbackStatusEnumMap, json['status']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$FeedbackDetailToJson(FeedbackDetail instance) =>
    <String, dynamic>{
      'feedbackId': instance.feedbackId,
      'examinee': instance.examinee,
      'shiftManager': instance.shiftManager,
      'violation': instance.violation,
      'content': instance.content,
      'reply': instance.reply,
      'status': _$FeedbackStatusEnumMap[instance.status],
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.inactive: 0,
  FeedbackStatus.pending: 1,
  FeedbackStatus.resolved: 2,
};
