// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_semester.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
