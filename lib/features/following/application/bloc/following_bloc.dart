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
  FollowingBloc({required this.followingRepository}) : super(FollowingState(BlocState.initial())) {
    on<FetchFollowingEvent>(_onFetchAllMyOrdersEvent);
  }

  FutureOr<void> _onFetchAllMyOrdersEvent(
    FetchFollowingEvent event,
    Emitter<FollowingState> emit,
  ) async {
    final currentData = state.state;
    emit(state.copyWith(state: BlocState.loading()));
    final result = await followingRepository.getFollowingCards();

    result.when(
      success: (success) {
        final List<CardBaseModel> updatedFollowingCardList = [
          ...currentData.dataOrNull?.allFollowingCards ?? [],
          success
        ];

        emit(state.copyWith(
          state: BlocState.data(FollowingStateWrapper(updatedFollowingCardList, false, null)),
        ));
      },
      error: (error) {
        print('KRISTOF' + error.toString());

        emit(state.copyWith(state: BlocState.error(error.errorMessage)));
      },
    );
  }
}
