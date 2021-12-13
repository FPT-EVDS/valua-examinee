import 'package:json_annotation/json_annotation.dart';

enum FeedbackStatus {
  @JsonValue(0)
  inactive,
  @JsonValue(1)
  pending,
  @JsonValue(2)
  resolved,
}
