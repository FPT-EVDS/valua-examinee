import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/models/detail_shift.dart';

abstract class ShiftRepository {
  Future<AssignedShift> getAssignedShift({DateTime? date});
  Future<DetailShift> getShiftDetail(String id);
}
