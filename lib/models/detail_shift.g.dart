// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailShift _$DetailShiftFromJson(Map<String, dynamic> json) => DetailShift(
      examRoomID: json['examRoomID'] as String,
      examRoomName: json['examRoomName'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      staff: AccountAlternative.fromJson(json['staff'] as Map<String, dynamic>),
      examSeats: (json['examSeats'] as List<dynamic>)
          .map((e) => ExamSeat.fromJson(e as Map<String, dynamic>))
          .toList(),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      status: $enumDecode(_$ViolationStatusEnumMap, json['status']),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
    );

Map<String, dynamic> _$DetailShiftToJson(DetailShift instance) =>
    <String, dynamic>{
      'examRoomID': instance.examRoomID,
      'examRoomName': instance.examRoomName,
      'shift': instance.shift,
      'staff': instance.staff,
      'examSeats': instance.examSeats,
      'room': instance.room,
      'subject': instance.subject,
      'status': _$ViolationStatusEnumMap[instance.status],
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
    };

const _$ViolationStatusEnumMap = {
  ViolationStatus.inactive: 0,
  ViolationStatus.pending: 1,
  ViolationStatus.confirmed: 2,
  ViolationStatus.rejected: 3,
};
