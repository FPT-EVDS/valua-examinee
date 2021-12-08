// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackList _$FeedbackListFromJson(Map<String, dynamic> json) => FeedbackList(
      totalItems: json['totalItems'] as int,
      totalPages: json['totalPages'] as int,
      feedbacks: (json['feedbacks'] as List<dynamic>)
          .map((e) => Feedback.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentPage: json['currentPage'] as int,
    );

Map<String, dynamic> _$FeedbackListToJson(FeedbackList instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'totalPages': instance.totalPages,
      'feedbacks': instance.feedbacks,
      'currentPage': instance.currentPage,
    };
