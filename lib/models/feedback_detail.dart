import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/violation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feedback_detail.g.dart';

@JsonSerializable()
class FeedbackDetail {
  String feedbackId;
  AccountAlternative examinee;
  AccountAlternative shiftManager;
  Violation violation;
  String content;
  String? reply;
  FeedbackStatus status;
  DateTime createdDate;
  DateTime lastModifiedDate;

  FeedbackDetail({
    required this.feedbackId,
    required this.examinee,
    required this.shiftManager,
    required this.violation,
    required this.content,
    required this.reply,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory FeedbackDetail.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDetailFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackDetailToJson(this);
}
