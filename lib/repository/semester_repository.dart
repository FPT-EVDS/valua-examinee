import 'package:valua_examinee/models/semester_list.dart';

abstract class SemesterRepository {
  Future<SemesterList> getSemesters({int? page, int? status});
}
