// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowingCard _$FollowingCardFromJson(Map<String, dynamic> json) =>
    FollowingCard(
      type: $enumDecode(_$CardModelTypeEnumMap, json['type']),
      id: json['id'] as int,
      playlist: json['playlist'] as String,
      flashcardFront: json['flashcard_front'] as String,
      flashcardBack: json['flashcard_back'] as String,
      description: json['description'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingCardToJson(FollowingCard instance) =>
    <String, dynamic>{
      'type': _$CardModelTypeEnumMap[instance.type]!,
      'id': instance.id,
      'playlist': instance.playlist,
      'description': instance.description,
      'user': instance.user,
      'flashcard_front': instance.flashcardFront,
      'flashcard_back': instance.flashcardBack,
    };

const _$CardModelTypeEnumMap = {
  CardModelType.mcq: 'mcq',
  CardModelType.flashcard: 'flashcard',
};
