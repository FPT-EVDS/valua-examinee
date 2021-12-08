import 'package:evds_examinee/models/violation_detail.dart';
import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/violation_repository.dart';

class ViolationProvider extends BaseProvider implements ViolationRepository {
  @override
  Future<ViolationList> getViolationList(
      {String? search, String? semesterId}) async {
    final response = await get("/violations", query: {
      "search": search,
      "semesterId:": semesterId,
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return ViolationList.fromJson(response.body);
  }

  @override
  Future<ViolationDetail> getViolationDetail(String id) async {
    final response = await get("/violations/$id");
    if (response.status.hasError) {
      throw (response.body);
    }
    return ViolationDetail.fromJson(response.body);
  }
}
