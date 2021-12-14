// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assigned_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AssignedShift _$AssignedShiftFromJson(Map<String, dynamic> json) =>
    AssignedShift(
      totalItems: json['totalItems'] as int,
      assignedShifts: AssignedShiftItem.fromJson(
          json['assignedShifts'] as Map<String, dynamic>),
      selectedDate: json['selectedDate'] as String,
    );

Map<String, dynamic> _$AssignedShiftToJson(AssignedShift instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'assignedShifts': instance.assignedShifts,
      'selectedDate': instance.selectedDate,
    };

AssignedShiftItem _$AssignedShiftItemFromJson(Map<String, dynamic> json) =>
    AssignedShiftItem(
      (json['assignedShift'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) =>
                    AsssignShiftDetail.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$AssignedShiftItemToJson(AssignedShiftItem instance) =>
    <String, dynamic>{
      'assignedShift': instance.assignedShift,
    };

AsssignShiftDetail _$AsssignShiftDetailFromJson(Map<String, dynamic> json) =>
    AsssignShiftDetail(
      examRoomID: json['examRoomID'] as String,
      examRoomName: json['examRoomName'] as String,
      shift: Shift.fromJson(json['shift'] as Map<String, dynamic>),
      room: Room.fromJson(json['room'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsssignShiftDetailToJson(AsssignShiftDetail instance) =>
    <String, dynamic>{
      'examRoomID': instance.examRoomID,
      'examRoomName': instance.examRoomName,
      'shift': instance.shift,
      'room': instance.room,
    };

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
      shiftId: json['shiftId'] as String,
      beginTime: DateTime.parse(json['beginTime'] as String),
      finishTime: DateTime.parse(json['finishTime'] as String),
    );

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'shiftId': instance.shiftId,
      'beginTime': instance.beginTime.toIso8601String(),
      'finishTime': instance.finishTime.toIso8601String(),
    };
