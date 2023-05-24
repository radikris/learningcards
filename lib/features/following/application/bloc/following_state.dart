part of 'following_bloc.dart';

class FollowingState {
  BlocState<FollowingStateWrapper> state;

  FollowingState(this.state);

  FollowingState copyWith({
    BlocState<FollowingStateWrapper>? state,
  }) {
    return FollowingState(
      state ?? this.state,
    );
  }
}

class FollowingStateWrapper {
  List<CardBaseModel> allFollowingCards;
  bool showAnswer;
  int? selectedAnswer;

  FollowingStateWrapper(this.allFollowingCards, this.showAnswer, this.selectedAnswer);

  FollowingStateWrapper copyWithBro({
    List<CardBaseModel>? followingCard,
    bool? showAnswer,
    int? selectedAnswer,
  }) {
    print('NEM FUT LE');
    return FollowingStateWrapper(
        followingCard ?? allFollowingCards, showAnswer ?? this.showAnswer, selectedAnswer ?? this.selectedAnswer);
  }
}
