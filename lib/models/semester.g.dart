// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Semester _$SemesterFromJson(Map<String, dynamic> json) => Semester(
      semesterId: json['semesterId'] as String,
      semesterName: json['semesterName'] as String,
      beginDate: json['beginDate'] as String,
      endDate: json['endDate'] as String,
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$SemesterToJson(Semester instance) => <String, dynamic>{
      'semesterId': instance.semesterId,
      'semesterName': instance.semesterName,
      'beginDate': instance.beginDate,
      'endDate': instance.endDate,
      'isActive': instance.isActive,
    };
