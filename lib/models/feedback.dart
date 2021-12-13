import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/violation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  String feedbackId;
  AccountAlternative examinee;
  AccountAlternative shiftManager;
  Violation violation;
  String content;
  String? reply;
  FeedbackStatus status;

  Feedback({
    required this.feedbackId,
    required this.examinee,
    required this.shiftManager,
    required this.violation,
    required this.content,
    required this.reply,
    required this.status,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}
