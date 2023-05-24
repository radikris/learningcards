import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/application/bloc_state.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/following/domain/following_repository.dart';

part 'following_event.dart';
part 'following_state.dart';

@injectable
class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final FollowingRepository followingRepository;
  FollowingBloc({required this.followingRepository}) : super(FollowingState([], false, const BlocState.initial(), 0)) {
    on<FetchFollowingEvent>(_onFetchAllFollowingEvent);
    on<SelectAnswerCardEvent>(_onSelectAnswer);
    on<ScrollCurrentPageEvent>(_onScrollPage);
  }

  FutureOr<void> _onFetchAllFollowingEvent(
    FetchFollowingEvent event,
    Emitter<FollowingState> emit,
  ) async {
    final currentData = state;
    if (currentData.state.isInitial) emit(state.copyWith(state: const BlocState.loading()));
    final result = await followingRepository.getFollowingCards();

    result.when(
      success: (success) {
        final List<CardWithAnswer> updatedFollowingCardList = [
          ...currentData.allFollowingCards,
          ...success.map((e) => CardWithAnswer.fromCard(e)).toList()
        ];

        emit(
          state.copyWith(state: const BlocState.data(), followingCard: updatedFollowingCardList),
        );
      },
      error: (error) {
        emit(state.copyWith(state: BlocState.error(error.errorMessage)));
      },
    );
  }

  void _onSelectAnswer(
    SelectAnswerCardEvent event,
    Emitter<FollowingState> emit,
  ) {
    int cardId = event.cardId ?? state.allFollowingCards[state.currentCardIdx].card.id;
    int? selectedAnswer = event.answer ?? state.allFollowingCards[state.currentCardIdx].selectedAnswer;

    if (event.cardId == null) {
      emit(
        state.copyWith(showAnswer: !state.showAnswer),
      );
    }
    final updatedList = state.allFollowingCards.map((card) {
      if (card.card.id == cardId) {
        final updatedCard = card.copyWith(selectedAnswer: selectedAnswer);
        return updatedCard;
      }
      return card;
    }).toList();

    emit(
      state.copyWith(
        followingCard: updatedList,
      ),
    );
  }

  void _onScrollPage(
    ScrollCurrentPageEvent event,
    Emitter<FollowingState> emit,
  ) {
    emit(
      state.copyWith(currentCardIdx: event.pageIndex, showAnswer: false),
    );
  }
}
