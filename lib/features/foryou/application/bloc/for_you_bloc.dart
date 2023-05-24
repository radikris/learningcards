import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/application/bloc_state.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/foryou/domain/for_you_repository.dart';

part 'for_you_event.dart';
part 'for_you_state.dart';

@injectable
class ForYouBloc extends Bloc<ForYouEvent, ForYouState> {
  final ForYouRepository forYouRepository;
  ForYouBloc({required this.forYouRepository}) : super(ForYouState([], false, BlocState.initial(), 0)) {
    on<FetchForYouEvent>(_onFetchAllForYouEvent);
    on<SelectAnswerCardEvent>(_onSelectAnswer);
    on<ScrollCurrentPageEvent>(_onScrollPage);
  }

  FutureOr<void> _onFetchAllForYouEvent(
    FetchForYouEvent event,
    Emitter<ForYouState> emit,
  ) async {
    final currentData = state;
    if (currentData.state.isInitial) emit(state.copyWith(state: BlocState.loading()));
    final result = await forYouRepository.getForYouCards();

    result.when(
      success: (success) {
        final List<CardWithMultipleChoice> updatedForYouCardList = [
          ...currentData.allForYouCards,
          ...success.map((e) => CardWithMultipleChoice.fromCard(e)).toList()
        ];

        emit(
          state.copyWith(state: BlocState.data(), forYouCard: updatedForYouCardList),
        );
      },
      error: (error) {
        emit(state.copyWith(state: BlocState.error(error.errorMessage)));
      },
    );
  }

  Future<void> _onSelectAnswer(
    SelectAnswerCardEvent event,
    Emitter<ForYouState> emit,
  ) async {
    //emit(state.copyWith(state: BlocState.loading()));
    final result = await forYouRepository.getAnswersForQuestion(event.cardId);

    result.when(
      success: (success) {
        final updatedList = state.allForYouCards.map((card) {
          if (card.card.id == event.cardId) {
            final updatedCard = card.copyWith(
                selectedAnswer: event.answer, correctAnswer: success.correctOptions.map((e) => e.id).toList());
            return updatedCard;
          }
          return card;
        }).toList();

        emit(
          state.copyWith(state: BlocState.data(), forYouCard: updatedList, showAnswer: true),
        );
      },
      error: (error) {
        emit(state.copyWith(state: BlocState.error(error.errorMessage)));
      },
    );
  }

  void _onScrollPage(
    ScrollCurrentPageEvent event,
    Emitter<ForYouState> emit,
  ) {
    emit(
      state.copyWith(
        currentCardIdx: event.pageIndex,
        showAnswer: false,
      ),
    );
  }
}
