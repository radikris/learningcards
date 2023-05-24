import 'package:json_annotation/json_annotation.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';

part 'common_models.g.dart';

enum CardModelType {
  @JsonValue('mcq')
  mcq,
  @JsonValue('flashcard')
  flashcard
}

abstract class CardBaseModel {
  CardModelType type;
  int id;
  String playlist;
  String description;
  User user;

  CardBaseModel({
    required this.type,
    required this.id,
    required this.playlist,
    required this.description,
    required this.user,
  });

  factory CardBaseModel.fromJson(Map<String, dynamic> json) {
    final cardType = json['type'] as CardModelType;

    switch (cardType) {
      case CardModelType.flashcard:
        return FollowingCard.fromJson(json);
      case CardModelType.mcq:
        return ForYouCard.fromJson(json);
    }
  }

  Map<String, dynamic> toJson();

  T accept<T>(CardVisitor<T> visitor, {Map<String, dynamic>? props});
}

@JsonSerializable()
class User {
  String name;
  String avatar;

  User({
    required this.name,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

enum FlashcardFeedbackEnum {
  bad,
  notbad,
  normal,
  good,
  great,
}
