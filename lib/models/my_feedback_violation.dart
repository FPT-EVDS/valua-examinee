import 'package:evds_examinee/models/exam_room.dart';
import 'package:json_annotation/json_annotation.dart';
part 'my_feedback_violation.g.dart';

@JsonSerializable()
class MyFeedbackViolation {
  String violationId;
  ExamRoom? examRoom;

  MyFeedbackViolation({
    required this.violationId,
    this.examRoom,
  });

  factory MyFeedbackViolation.fromJson(Map<String, dynamic> json) =>
      _$MyFeedbackViolationFromJson(json);

  Map<String, dynamic> toJson() => _$MyFeedbackViolationToJson(this);
}
