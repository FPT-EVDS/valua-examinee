import 'package:json_annotation/json_annotation.dart';
import 'package:valua_examinee/enums/shift_status.dart';
import 'package:valua_examinee/models/room.dart';
import 'package:valua_examinee/models/subject_semester.dart';
part 'shift_detail.g.dart';

@JsonSerializable()
class ShiftDetail {
  String examRoomId;
  Shift shift;
  Room room;
  SubjectSemester subjectSemester;

  ShiftDetail({
    required this.examRoomId,
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
  DateTime beginTime;
  DateTime finishTime;
  ShiftStatus status;

  Shift({
    required this.shiftId,
    required this.beginTime,
    required this.finishTime,
    required this.status,
  });

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
