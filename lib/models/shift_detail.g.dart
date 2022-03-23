// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShiftDetail _$ShiftDetailFromJson(Map<String, dynamic> json) => ShiftDetail(
      examRoomId: json['examRoomId'] as String,
      examRoomName: json['examRoomName'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
      subjectSemester: SubjectSemester.fromJson(
          json['subjectSemester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShiftDetailToJson(ShiftDetail instance) =>
    <String, dynamic>{
      'examRoomId': instance.examRoomId,
      'examRoomName': instance.examRoomName,
      'shift': instance.shift,
      'room': instance.room,
      'subjectSemester': instance.subjectSemester,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftId: json['shiftId'] as String,
      shiftManager: AccountAlternative.fromJson(
          json['shiftManager'] as Map<String, dynamic>),
      status: $enumDecode(_$ShiftStatusEnumMap, json['status']),
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftId': instance.shiftId,
      'shiftManager': instance.shiftManager,
      'status': _$ShiftStatusEnumMap[instance.status],
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
    };

const _$ShiftStatusEnumMap = {
  ShiftStatus.removed: 0,
  ShiftStatus.finished: 1,
  ShiftStatus.locked: 2,
  ShiftStatus.ready: 3,
  ShiftStatus.notReady: 4,
  ShiftStatus.staffing: 5,
  ShiftStatus.ongoing: 6,
};

SubjectSemester _$SubjectSemesterFromJson(Map<String, dynamic> json) =>
    SubjectSemester(
      subjectSemesterId: json['subjectSemesterId'] as String,
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      semester: Semester.fromJson(json['semester'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectSemesterToJson(SubjectSemester instance) =>
    <String, dynamic>{
      'subjectSemesterId': instance.subjectSemesterId,
      'subject': instance.subject,
      'semester': instance.semester,
    };

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      semesterId: json['semesterId'] as String,
      semesterName: json['semesterName'] as String,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
    };
