import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/models/my_feedback.dart';
import 'package:json_annotation/json_annotation.dart';
part 'feedback_list.g.dart';

@JsonSerializable()
class FeedbackList {
  int totalItems;
  int totalPages;
  List<MyFeedback> feedbacks;
  int currentPage;

  FeedbackList({
    required this.totalItems,
    required this.totalPages,
    required this.feedbacks,
    required this.currentPage,
  });

  factory FeedbackList.fromJson(Map<String, dynamic> json) =>
      _$FeedbackListFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackListToJson(this);
}
