import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/models/semester.dart';
import 'package:evds_examinee/providers/semester_provider.dart';
import 'package:evds_examinee/providers/shift_provider.dart';
import 'package:evds_examinee/repository/semester_repository.dart';
import 'package:evds_examinee/repository/shift_repository.dart';
import 'package:get/get.dart';

class ShiftController extends GetxController {
  final assignedShiftList = Future<AssignedShift?>.value().obs;
  final Rx<Semester>? currentSemester = null;
  final ShiftRepository _shiftRepository = Get.find<ShiftProvider>();
  final SemesterRepository _semesterRepository = Get.find<SemesterProvider>();

  Future<void> getAssignedShift({String? semesterId}) async {
    try {
      assignedShiftList.value =
          _shiftRepository.getAssignedShift(semesterId: semesterId);
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
      getAssignedShift(semesterId: semester.semesterId);
    }
  }

  @override
  void onInit() {
    getListSemesters().then(
      (value) => getAssignedShift(semesterId: value.first.semesterId),
    );
    super.onInit();
  }
}
