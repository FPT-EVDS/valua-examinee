// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViolationList _$ViolationListFromJson(Map<String, dynamic> json) =>
    ViolationList(
      totalItems: json['totalItems'] as int,
      violations: (json['violations'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['totalPages'] as int,
      currentPage: json['currentPage'] as int,
    );

Map<String, dynamic> _$ViolationListToJson(ViolationList instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'violations': instance.violations,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };
