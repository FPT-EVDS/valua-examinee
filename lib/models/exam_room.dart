import 'package:valua_examinee/models/account_alternative.dart';
import 'package:valua_examinee/models/room.dart';
import 'package:valua_examinee/models/subject.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_room.g.dart';

@JsonSerializable()
class ExamRoom {
  String examRoomID;
  String examRoomName;
  AccountAlternative staff;
  Room room;
  Subject subject;
  int status;

  ExamRoom({
    required this.examRoomID,
    required this.examRoomName,
    required this.staff,
    required this.room,
    required this.subject,
    required this.status,
  });

  factory ExamRoom.fromJson(Map<String, dynamic> json) =>
      _$ExamRoomFromJson(json);

  Map<String, dynamic> toJson() => _$ExamRoomToJson(this);
}
