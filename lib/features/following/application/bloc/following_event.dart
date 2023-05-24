part of 'following_bloc.dart';

abstract class FollowingEvent extends Equatable {
  const FollowingEvent();

  @override
  List<Object> get props => [];
}

class FetchFollowingEvent extends FollowingEvent {
  /// {@macro custom_my_orders_event}
  const FetchFollowingEvent();

  @override
  List<Object> get props => [];
}

class SelectAnswerCardEvent extends FollowingEvent {
  SelectAnswerCardEvent({required this.cardId, required this.answer});
  final int cardId;
  final int answer;

  @override
  List<Object> get props => [cardId, answer];
}

class ScrollCurrentPageEvent extends FollowingEvent {
  ScrollCurrentPageEvent({required this.pageIndex});
  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}
