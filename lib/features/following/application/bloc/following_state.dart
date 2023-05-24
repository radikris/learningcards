// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'following_bloc.dart';

class FollowingState {
  BlocState state;
  List<CardWithAnswer> allFollowingCards;
  bool showAnswer;
  int currentCardIdx;

  FollowingState(this.allFollowingCards, this.showAnswer, this.state, this.currentCardIdx);

  FollowingState copyWith({
    List<CardWithAnswer>? followingCard,
    bool? showAnswer,
    BlocState? state,
    int? currentCardIdx,
  }) {
    return FollowingState(followingCard ?? allFollowingCards, showAnswer ?? this.showAnswer, state ?? this.state,
        currentCardIdx ?? this.currentCardIdx);
  }
}

class CardWithAnswer {
  CardBaseModel card;
  int? selectedAnswer;

  CardWithAnswer(this.card, this.selectedAnswer);

  CardWithAnswer copyWith({
    CardBaseModel? card,
    int? selectedAnswer,
  }) {
    return CardWithAnswer(
      card ?? this.card,
      selectedAnswer ?? this.selectedAnswer,
    );
  }

  factory CardWithAnswer.fromCard(CardBaseModel card) {
    return CardWithAnswer(card, null);
  }
}
