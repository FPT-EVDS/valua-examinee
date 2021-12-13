import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/providers/violation_provider.dart';
import 'package:evds_examinee/repository/violation_repository.dart';
import 'package:get/get.dart';

class ViolationController extends GetxController {
  final violationList = Future<ViolationList?>.value().obs;
  final ViolationRepository _violationRepository =
      Get.find<ViolationProvider>();

  Future<void> getOwnViolation({String? search}) async {
    try {
      final data = _violationRepository.getViolationList(search: search);
      violationList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getOwnViolation();
  }
}
