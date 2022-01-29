// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_seat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamSeat _$ExamSeatFromJson(Map<String, dynamic> json) => ExamSeat(
      examSeatId: json['examSeatId'] as String,
      examinee:
          AccountAlternative.fromJson(json['examinee'] as Map<String, dynamic>),
      position: json['position'] as int,
    );

Map<String, dynamic> _$ExamSeatToJson(ExamSeat instance) => <String, dynamic>{
      'examSeatId': instance.examSeatId,
      'examinee': instance.examinee,
      'position': instance.position,
    };
