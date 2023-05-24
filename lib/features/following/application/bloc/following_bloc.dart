import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/application/bloc_state.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/following/domain/following_repository.dart';

part 'following_event.dart';
part 'following_state.dart';

@injectable
class FollowingBloc extends Bloc<FollowingEvent, FollowingState> {
  final FollowingRepository followingRepository;
  FollowingBloc({required this.followingRepository}) : super(FollowingState([], false, BlocState.initial(), 0)) {
    on<FetchFollowingEvent>(_onFetchAllMyOrdersEvent);
    on<SelectAnswerCardEvent>(_onSelectAnswer);
    on<ScrollCurrentPageEvent>(_onScrollPage);
  }

  FutureOr<void> _onFetchAllMyOrdersEvent(
    FetchFollowingEvent event,
    Emitter<FollowingState> emit,
  ) async {
    final currentData = state;
    if (currentData.state.isInitial) emit(state.copyWith(state: BlocState.loading()));
    final result = await followingRepository.getFollowingCards();

    result.when(
      success: (success) {
        final List<CardWithAnswer> updatedFollowingCardList = [
          ...currentData.allFollowingCards,
          ...success.map((e) => CardWithAnswer.fromCard(e)).toList()
        ];

        print('SORREND');
        updatedFollowingCardList.forEach((e) => print(e.card.id));
        print('*******');

        emit(
          state.copyWith(state: BlocState.data(), followingCard: updatedFollowingCardList),
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
    final updatedList = state.allFollowingCards.map((card) {
      if (card.card.id == event.cardId) {
        final updatedCard = card.copyWith(selectedAnswer: event.answer);
        return updatedCard;
      }
      return card;
    }).toList();

    emit(
      state.copyWith(followingCard: updatedList),
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
