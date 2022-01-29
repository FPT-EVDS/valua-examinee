import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feedback.g.dart';

@JsonSerializable()
class Feedback {
  String feedbackId;
  AccountAlternative examinee;
  AccountAlternative shiftManager;
  FeedbackViolation violation;
  FeedbackStatus status;
  DateTime createdDate;
  DateTime lastModifiedDate;

  Feedback({
    required this.feedbackId,
    required this.examinee,
    required this.shiftManager,
    required this.violation,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackToJson(this);
}

@JsonSerializable()
class FeedbackViolation {
  String violationId;
  FeedbackEvidence evidence;

  FeedbackViolation({
    required this.violationId,
    required this.evidence,
  });

  factory FeedbackViolation.fromJson(Map<String, dynamic> json) =>
      _$FeedbackViolationFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackViolationToJson(this);
}

@JsonSerializable()
class FeedbackEvidence {
  String evidenceId;
  EvidenceExamRoom examRoom;

  FeedbackEvidence({
    required this.evidenceId,
    required this.examRoom,
  });

  factory FeedbackEvidence.fromJson(Map<String, dynamic> json) =>
      _$FeedbackEvidenceFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackEvidenceToJson(this);
}

@JsonSerializable()
class EvidenceExamRoom {
  String examRoomId;
  String examRoomName;

  EvidenceExamRoom({
    required this.examRoomId,
    required this.examRoomName,
  });

  factory EvidenceExamRoom.fromJson(Map<String, dynamic> json) =>
      _$EvidenceExamRoomFromJson(json);

  Map<String, dynamic> toJson() => _$EvidenceExamRoomToJson(this);
}
