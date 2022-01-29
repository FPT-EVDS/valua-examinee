import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/models/violation_detail.dart';
import 'package:evds_examinee/providers/feedback_provider.dart';
import 'package:evds_examinee/providers/violation_provider.dart';
import 'package:evds_examinee/repository/feedback_repository.dart';
import 'package:evds_examinee/repository/violation_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailViolationController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final isLoading = false.obs;
  late TextEditingController contentController;
  final violation = Future<ViolationDetail?>.value().obs;
  late final String violationId;
  final ViolationRepository _violationRepository =
      Get.find<ViolationProvider>();
  final FeedbackRepository _feedbackRepository = Get.find<FeedbackProvider>();

  Future<void> getViolationDetail(String id) async {
    try {
      final data = _violationRepository.getViolationDetail(id);
      violation.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> submitFeedback(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String content = contentController.text;
      try {
        isLoading.value = true;
        await _feedbackRepository.createFeedback(violationId, content);
        contentController.clear();
        Get.back();
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          title: "Feedback submitted !",
        );
      } catch (e) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.error,
          text: e.toString(),
        );
      } finally {
        isLoading.value = false;
      }
    }
  }

  @override
  void onInit() {
    violationId = Get.arguments['id'];
    contentController = TextEditingController();
    getViolationDetail(violationId);
    super.onInit();
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }
}
