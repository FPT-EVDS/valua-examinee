import 'package:json_annotation/json_annotation.dart';
import 'package:valua_examinee/models/account_alternative.dart';
part 'attendance.g.dart';

@JsonSerializable()
class Attendance {
  CurrentAttendance currentAttendance;

  Attendance({
    required this.currentAttendance,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) =>
      _$AttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$AttendanceToJson(this);
}

@JsonSerializable()
class CurrentAttendance {
  String attendanceId;
  AccountAlternative examinee;
  int position;
  ExamRoom examRoom;
  List<dynamic> attempts;
  DateTime? startTime;
  DateTime? finishTime;
  DateTime createdDate;
  DateTime lastModified;

  CurrentAttendance({
    required this.attendanceId,
    required this.examinee,
    required this.position,
    required this.examRoom,
    required this.attempts,
    this.startTime,
    this.finishTime,
    required this.createdDate,
    required this.lastModified,
  });

  factory CurrentAttendance.fromJson(Map<String, dynamic> json) =>
      _$CurrentAttendanceFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentAttendanceToJson(this);
}

@JsonSerializable()
class ExamRoom {
  String examRoomId;
  String examRoomName;

  ExamRoom({
    required this.examRoomId,
    required this.examRoomName,
  });

  factory ExamRoom.fromJson(Map<String, dynamic> json) =>
      _$ExamRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ExamRoomToJson(this);
}
