// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'for_you_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForYouCard _$ForYouCardFromJson(Map<String, dynamic> json) => ForYouCard(
      type: $enumDecode(_$CardModelTypeEnumMap, json['type']),
      id: json['id'] as int,
      playlist: json['playlist'] as String,
      description: json['description'] as String,
      question: json['question'] as String,
      options: (json['options'] as List<dynamic>)
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForYouCardToJson(ForYouCard instance) =>
    <String, dynamic>{
      'type': _$CardModelTypeEnumMap[instance.type]!,
      'id': instance.id,
      'playlist': instance.playlist,
      'description': instance.description,
      'user': instance.user,
      'question': instance.question,
      'options': instance.options,
    };

const _$CardModelTypeEnumMap = {
  CardModelType.mcq: 'mcq',
  CardModelType.flashcard: 'flashcard',
};

Option _$OptionFromJson(Map<String, dynamic> json) => Option(
      id: json['id'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'id': instance.id,
      'answer': instance.answer,
    };
