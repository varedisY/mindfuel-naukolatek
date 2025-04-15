// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Person _$PersonFromJson(Map<String, dynamic> json) => _Person(
  content: json['content'] as String,
  hints: (json['hints'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$PersonToJson(_Person instance) => <String, dynamic>{
  'content': instance.content,
  'hints': instance.hints,
};
