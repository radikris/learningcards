import 'package:json_annotation/json_annotation.dart';

part 'for_you_answer_model.g.dart';

@JsonSerializable()
class ForYouAnswerModel {
  final int id;
  @JsonKey(name: 'correct_options')
  final List<CorrectOptionModel> correctOptions;

  ForYouAnswerModel({
    required this.id,
    required this.correctOptions,
  });

  factory ForYouAnswerModel.fromJson(Map<String, dynamic> json) => _$ForYouAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForYouAnswerModelToJson(this);
}

@JsonSerializable()
class CorrectOptionModel {
  final String id;
  final String answer;

  CorrectOptionModel({
    required this.id,
    required this.answer,
  });

  factory CorrectOptionModel.fromJson(Map<String, dynamic> json) => _$CorrectOptionModelFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectOptionModelToJson(this);
}
