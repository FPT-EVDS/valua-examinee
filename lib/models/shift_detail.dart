import 'package:json_annotation/json_annotation.dart';
import 'package:valua_examinee/enums/shift_status.dart';
import 'package:valua_examinee/models/account_alternative.dart';
import 'package:valua_examinee/models/room.dart';
import 'package:valua_examinee/models/subject.dart';
part 'shift_detail.g.dart';

@JsonSerializable()
class ShiftDetail {
  String examRoomId;
  String examRoomName;
  Shift shift;
  Room room;
  SubjectSemester subjectSemester;

  ShiftDetail({
    required this.examRoomId,
    required this.examRoomName,
    required this.shift,
    required this.room,
    required this.subjectSemester,
  });

  factory ShiftDetail.fromJson(Map<String, dynamic> json) =>
      _$ShiftDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftDetailToJson(this);
}

@JsonSerializable()
class Shift {
  String shiftId;
  AccountAlternative shiftManager;
  ShiftStatus status;
  DateTime beginTime;
  DateTime finishTime;

  Shift({
    required this.shiftId,
    required this.shiftManager,
    required this.status,
    required this.beginTime,
    required this.finishTime,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}

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
