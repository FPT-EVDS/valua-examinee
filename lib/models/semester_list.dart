import 'package:valua_examinee/models/semester.dart';
import 'package:json_annotation/json_annotation.dart';
part 'semester_list.g.dart';

@JsonSerializable()
class SemesterList {
  int totalItems;
  int totalPages;
  List<Semester> semesters;
  int currentPage;

  SemesterList({
    required this.totalItems,
    required this.totalPages,
    required this.semesters,
    required this.currentPage,
  });

  factory SemesterList.fromJson(Map<String, dynamic> json) =>
      _$SemesterListFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterListToJson(this);
}
