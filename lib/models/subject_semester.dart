import 'package:json_annotation/json_annotation.dart';
import 'package:valua_examinee/models/subject.dart';
part 'subject_semester.g.dart';

@JsonSerializable()
class SubjectSemester {
  String subjectSemesterId;
  Subject subject;
  Semester semester;

  SubjectSemester({
    required this.subjectSemesterId,
    required this.subject,
    required this.semester,
  });

  factory SubjectSemester.fromJson(Map<String, dynamic> json) =>
      _$SubjectSemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectSemesterToJson(this);
}

@JsonSerializable()
class Semester {
  String semesterId;
  String semesterName;

  Semester({
    required this.semesterId,
    required this.semesterName,
  });

  factory Semester.fromJson(Map<String, dynamic> json) =>
      _$SemesterFromJson(json);

  Map<String, dynamic> toJson() => _$SemesterToJson(this);
}
