import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/models/shift_detail.dart';

abstract class ShiftRepository {
  Future<AssignedShift> getAssignedShift({String? semesterId});
  Future<ShiftDetail> getShiftDetail(String id);
}
