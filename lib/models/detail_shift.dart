import 'package:evds_examinee/enums/violation_status.dart';
import 'package:evds_examinee/models/account_alternative.dart';
import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/models/exam_seat.dart';
import 'package:evds_examinee/models/room.dart';
import 'package:evds_examinee/models/subject.dart';
import 'package:json_annotation/json_annotation.dart';
part 'detail_shift.g.dart';

@JsonSerializable()
class DetailShift {
  String examRoomID;
  String examRoomName;
  Shift shift;
  AccountAlternative staff;
  List<ExamSeat> examSeats;
  Room room;
  Subject subject;
  ViolationStatus status;
  DateTime createdDate;
  DateTime lastModifiedDate;

  DetailShift({
    required this.examRoomID,
    required this.examRoomName,
    required this.shift,
    required this.staff,
    required this.examSeats,
    required this.room,
    required this.subject,
    required this.status,
    required this.createdDate,
    required this.lastModifiedDate,
  });

  factory DetailShift.fromJson(Map<String, dynamic> json) =>
      _$DetailShiftFromJson(json);

  Map<String, dynamic> toJson() => _$DetailShiftToJson(this);
}
