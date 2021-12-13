// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_feedback.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFeedback _$MyFeedbackFromJson(Map<String, dynamic> json) => MyFeedback(
      feedbackId: json['feedbackId'] as String,
      examinee:
          AccountAlternative.fromJson(json['examinee'] as Map<String, dynamic>),
      shiftManager: AccountAlternative.fromJson(
          json['shiftManager'] as Map<String, dynamic>),
      violation: MyFeedbackViolation.fromJson(
          json['violation'] as Map<String, dynamic>),
      status: $enumDecode(_$FeedbackStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$MyFeedbackToJson(MyFeedback instance) =>
    <String, dynamic>{
      'feedbackId': instance.feedbackId,
      'examinee': instance.examinee,
      'shiftManager': instance.shiftManager,
      'violation': instance.violation,
      'status': _$FeedbackStatusEnumMap[instance.status],
    };

const _$FeedbackStatusEnumMap = {
  FeedbackStatus.inactive: 0,
  FeedbackStatus.pending: 1,
  FeedbackStatus.resolved: 2,
};
