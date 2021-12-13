import 'package:evds_examinee/models/violation_list.dart';

abstract class ViolationRepository {
  Future<ViolationList> getViolationList({String? search});
}
