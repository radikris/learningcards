import 'package:json_annotation/json_annotation.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/domain/common_models.dart';

part 'for_you_card_model.g.dart';

@JsonSerializable()
class ForYouCard extends CardBaseModel {
  String question;
  List<Option> options;

  ForYouCard({
    required CardModelType type,
    required int id,
    required String playlist,
    required String description,
    required this.question,
    required this.options,
    required User user,
  }) : super(
          type: type,
          id: id,
          playlist: playlist,
          description: description,
          user: user,
        );

  factory ForYouCard.fromJson(Map<String, dynamic> json) => _$ForYouCardFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$ForYouCardToJson(this);

  @override
  T accept<T>(CardVisitor<T> visitor, {Map<String, dynamic>? props}) {
    return visitor.visitMultipleChoice(this, props: props);
  }
}

@JsonSerializable()
class Option {
  String id;
  String answer;

  Option({
    required this.id,
    required this.answer,
  });

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
