import 'package:evds_examinee/models/feedback.dart';

abstract class FeedbackRepository {
  Future<Feedback> createFeedback(String violationId, String content);
}
