import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/models/feedback_list.dart';
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

  @override
  Future<FeedbackList> getOwnFeedbacks() async {
    final response = await get("/feedbacks/myFeedbacks");
    if (response.status.hasError) {
      throw (response.body);
    }
    return FeedbackList.fromJson(response.body);
  }

  @override
  Future<Feedback> getFeedback(String id) async {
    final response = await get("/feedbacks/$id");
    if (response.status.hasError) {
      throw (response.body);
    }
    return Feedback.fromJson(response.body);
  }
}
