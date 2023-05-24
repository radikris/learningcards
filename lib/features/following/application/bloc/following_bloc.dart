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
  FollowingBloc({required this.followingRepository}) : super(FollowingState([], false, BlocState.initial())) {
    on<FetchFollowingEvent>(_onFetchAllMyOrdersEvent);
    on<SelectAnswerCardEvent>(_onSelectAnswer);
  }

  FutureOr<void> _onFetchAllMyOrdersEvent(
    FetchFollowingEvent event,
    Emitter<FollowingState> emit,
  ) async {
    final currentData = state;
    emit(state.copyWith(state: BlocState.loading()));
    final result = await followingRepository.getFollowingCards();

    result.when(
      success: (success) {
        final List<CardWithAnswer> updatedFollowingCardList = [
          ...currentData.allFollowingCards,
          CardWithAnswer.fromCard(success)
        ];
        print('UJ HOSSZ' + updatedFollowingCardList.length.toString() + updatedFollowingCardList.toString());

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
}
