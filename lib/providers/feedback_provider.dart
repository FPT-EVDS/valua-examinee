import 'package:evds_examinee/models/feedback_detail.dart';
import 'package:evds_examinee/models/feedback_list.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/feedback_repository.dart';

class FeedbackProvider extends BaseProvider implements FeedbackRepository {
  @override
  Future<FeedbackDetail> createFeedback(
      String violationId, String content) async {
    final response = await post("/feedbacks", {
      "content": content,
      "violation": {
        "violationId": violationId,
      }
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return FeedbackDetail.fromJson(response.body);
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
  Future<FeedbackDetail> getFeedback(String id) async {
    final response = await get("/feedbacks/$id");
    if (response.status.hasError) {
      throw (response.body);
    }
    return FeedbackDetail.fromJson(response.body);
  }
}
