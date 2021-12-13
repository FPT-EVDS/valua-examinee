// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamRoom _$ExamRoomFromJson(Map<String, dynamic> json) => ExamRoom(
      examRoomID: json['examRoomID'] as String,
      examRoomName: json['examRoomName'] as String,
      staff: AccountAlternative.fromJson(json['staff'] as Map<String, dynamic>),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      status: json['status'] as int,
    );

Map<String, dynamic> _$ExamRoomToJson(ExamRoom instance) => <String, dynamic>{
      'examRoomID': instance.examRoomID,
      'examRoomName': instance.examRoomName,
      'staff': instance.staff,
      'room': instance.room,
      'subject': instance.subject,
      'status': instance.status,
    };
