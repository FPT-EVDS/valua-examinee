import 'package:evds_examinee/models/feedback_detail.dart';
import 'package:evds_examinee/models/feedback_list.dart';

abstract class FeedbackRepository {
  Future<FeedbackDetail> createFeedback(String violationId, String content);
  Future<FeedbackList> getOwnFeedbacks();
  Future<FeedbackDetail> getFeedback(String id);
}
