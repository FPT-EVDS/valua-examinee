import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/shift_repository.dart';

class ShiftProvider extends BaseProvider implements ShiftRepository {
  @override
  Future<AssignedShift> getAssignedShift({DateTime? date}) async {
    final response = await get("/examRooms/assigned", query: {
      "date": date != null
          ? date.toIso8601String()
          : DateTime.now().toIso8601String(),
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return AssignedShift.fromJson(response.body);
  }
}
