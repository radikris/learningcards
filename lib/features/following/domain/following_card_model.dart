import 'package:json_annotation/json_annotation.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/domain/common_models.dart';

part 'following_card_model.g.dart';

@JsonSerializable()
class FollowingCard extends CardBaseModel {
  @JsonKey(name: 'flashcard_front')
  String flashcardFront;
  @JsonKey(name: 'flashcard_back')
  String flashcardBack;

  FollowingCard({
    required CardModelType type,
    required int id,
    required String playlist,
    required this.flashcardFront,
    required this.flashcardBack,
    required String description,
    required User user,
  }) : super(
          type: type,
          id: id,
          playlist: playlist,
          description: description,
          user: user,
        );

  factory FollowingCard.fromJson(Map<String, dynamic> json) => _$FollowingCardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$FollowingCardToJson(this);

  @override
  T accept<T>(CardVisitor<T> visitor, {Map<String, dynamic>? props}) {
    return visitor.visitFlashcard(this, props: props);
  }
}
