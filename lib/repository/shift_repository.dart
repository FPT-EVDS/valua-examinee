import 'package:evds_examinee/models/assigned_shift.dart';

abstract class ShiftRepository {
  Future<AssignedShift> getAssignedShift({DateTime? date});
}
