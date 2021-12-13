import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/feedback_repository.dart';

class FeedbackProvider extends BaseProvider implements FeedbackRepository {
  @override
  Future<Feedback> createFeedback(String violationId, String content) async {
    final response = await post("/feedbacks", {
      "content": content,
      "violation": {
        "violationId": violationId,
      }
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return Feedback.fromJson(response.body);
  }
}
