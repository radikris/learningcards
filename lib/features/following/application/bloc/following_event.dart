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
