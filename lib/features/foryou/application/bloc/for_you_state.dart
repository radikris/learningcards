// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'for_you_bloc.dart';

class ForYouState {
  BlocState state;
  List<CardWithMultipleChoice> allForYouCards;
  bool showAnswer;
  int currentCardIdx;

  ForYouState(this.allForYouCards, this.showAnswer, this.state, this.currentCardIdx);

  ForYouState copyWith({
    List<CardWithMultipleChoice>? forYouCard,
    bool? showAnswer,
    BlocState? state,
    int? currentCardIdx,
  }) {
    return ForYouState(forYouCard ?? allForYouCards, showAnswer ?? this.showAnswer, state ?? this.state,
        currentCardIdx ?? this.currentCardIdx);
  }
}

class CardWithMultipleChoice {
  CardBaseModel card;
  String? selectedAnswer;
  List<String>? correctAnswer;

  CardWithMultipleChoice(this.card, this.selectedAnswer, this.correctAnswer);

  CardWithMultipleChoice copyWith({
    CardBaseModel? card,
    String? selectedAnswer,
    List<String>? correctAnswer,
  }) {
    return CardWithMultipleChoice(
        card ?? this.card, selectedAnswer ?? this.selectedAnswer, correctAnswer ?? this.correctAnswer);
  }

  factory CardWithMultipleChoice.fromCard(CardBaseModel card) {
    return CardWithMultipleChoice(card, null, null);
  }
}
