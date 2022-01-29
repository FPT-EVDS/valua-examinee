import 'package:evds_examinee/models/semester.dart';
import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/providers/semester_provider.dart';
import 'package:evds_examinee/providers/violation_provider.dart';
import 'package:evds_examinee/repository/semester_repository.dart';
import 'package:evds_examinee/repository/violation_repository.dart';
import 'package:get/get.dart';

class ViolationController extends GetxController {
  final violationList = Future<ViolationList?>.value().obs;
  final Rx<Semester>? currentSemester = null;
  final SemesterRepository _semesterRepository = Get.find<SemesterProvider>();
  final ViolationRepository _violationRepository =
      Get.find<ViolationProvider>();

  Future<void> getOwnViolation({String? search, String? semesterId}) async {
    try {
      final data = _violationRepository.getViolationList(
        search: search,
        semesterId: semesterId ?? currentSemester!.value.semesterId,
      );
      violationList.value = data;
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<List<Semester>> getListSemesters() async {
    try {
      final data = await _semesterRepository.getSemesters();
      return data.semesters;
    } catch (err) {
      throw Exception(err);
    }
  }

  void handleChangeSemester(Semester? semester) {
    if (semester != null) {
      currentSemester?.value = semester;
      getOwnViolation(semesterId: semester.semesterId);
    }
  }

  @override
  void onInit() {
    getListSemesters().then((value) {
      currentSemester?.value = value.first;
      getOwnViolation(semesterId: value.first.semesterId);
    });
    super.onInit();
  }
}
