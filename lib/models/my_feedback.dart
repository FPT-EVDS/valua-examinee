import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/my_feedback_violation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_feedback.g.dart';

@JsonSerializable()
class MyFeedback {
  String feedbackId;
  AccountAlternative examinee;
  AccountAlternative shiftManager;
  MyFeedbackViolation violation;
  FeedbackStatus status;

  MyFeedback({
    required this.feedbackId,
    required this.examinee,
    required this.shiftManager,
    required this.violation,
    required this.status,
  });

  factory MyFeedback.fromJson(Map<String, dynamic> json) =>
      _$MyFeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$MyFeedbackToJson(this);
}
