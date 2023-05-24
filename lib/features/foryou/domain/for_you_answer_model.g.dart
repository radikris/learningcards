// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_you_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForYouAnswerModel _$ForYouAnswerModelFromJson(Map<String, dynamic> json) =>
    ForYouAnswerModel(
      id: json['id'] as int,
      correctOptions: (json['correct_options'] as List<dynamic>)
          .map((e) => CorrectOptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForYouAnswerModelToJson(ForYouAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'correct_options': instance.correctOptions,
    };

CorrectOptionModel _$CorrectOptionModelFromJson(Map<String, dynamic> json) =>
    CorrectOptionModel(
      id: json['id'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$CorrectOptionModelToJson(CorrectOptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
    };
