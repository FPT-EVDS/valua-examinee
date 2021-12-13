import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/violation_repository.dart';

class ViolationProvider extends BaseProvider implements ViolationRepository {
  @override
  Future<ViolationList> getViolationList({String? search}) async {
    final response = await get("/violations");
    if (response.status.hasError) {
      throw (response.body);
    }
    return ViolationList.fromJson(response.body);
  }
}
