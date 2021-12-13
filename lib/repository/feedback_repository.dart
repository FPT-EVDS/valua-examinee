import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/models/feedback_list.dart';

abstract class FeedbackRepository {
  Future<Feedback> createFeedback(String violationId, String content);
  Future<FeedbackList> getOwnFeedbacks();
  Future<Feedback> getFeedback(String id);
}
