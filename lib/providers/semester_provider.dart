import 'package:evds_examinee/models/semester_list.dart';
import 'package:evds_examinee/providers/base_provider.dart';
import 'package:evds_examinee/repository/semester_repository.dart';

class SemesterProvider extends BaseProvider implements SemesterRepository {
  @override
  Future<SemesterList> getSemesters({int? page, int? status}) async {
    // Fixed parameter for sorting by begin date
    final response = await get("/semesters", query: {
      "sort": "beginDate,desc",
      "status": status?.toString(),
      "page": page.toString(),
    });
    if (response.status.hasError) {
      throw (response.body);
    }
    return SemesterList.fromJson(response.body);
  }
}
