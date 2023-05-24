part of 'for_you_bloc.dart';

abstract class ForYouEvent extends Equatable {
  const ForYouEvent();

  @override
  List<Object> get props => [];
}

class FetchForYouEvent extends ForYouEvent {
  /// {@macro custom_my_orders_event}
  const FetchForYouEvent();

  @override
  List<Object> get props => [];
}

class SelectAnswerCardEvent extends ForYouEvent {
  SelectAnswerCardEvent({required this.cardId, required this.answer});
  final int cardId;
  final String answer;

  @override
  List<Object> get props => [cardId, answer];
}

class ScrollCurrentPageEvent extends ForYouEvent {
  ScrollCurrentPageEvent({required this.pageIndex});
  final int pageIndex;

  @override
  List<Object> get props => [pageIndex];
}
