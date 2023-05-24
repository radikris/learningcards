import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/application/bloc_state.dart';
import 'package:learningcards/features/common/presentation/app_loader.dart';
import 'package:learningcards/features/common/presentation/infinite_scroll_page.dart';
import 'package:learningcards/features/common/presentation/play_list.dart';
import 'package:learningcards/features/common/presentation/side_action_button.dart';
import 'package:learningcards/features/common/presentation/side_action_list.dart';
import 'package:learningcards/features/following/application/bloc/following_bloc.dart';
import 'package:learningcards/gen/assets.gen.dart';
import 'package:learningcards/injectable.dart';

class FollowingPage extends StatelessWidget {
  const FollowingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowingBloc>(
      create: (context) => getIt<FollowingBloc>()..add(FetchFollowingEvent()),
      child: FollowingView(),
    );
  }
}

class FollowingView extends StatefulWidget {
  @override
  _FollowingViewState createState() => _FollowingViewState();
}

class _FollowingViewState extends State<FollowingView> {
  final CardVisitor<Widget> visitor = CardWidgetVisitor();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FollowingBloc>();
    final blocState = context.watch<FollowingBloc>().state;
    final state = blocState.state;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        if (state.isLoading) {
          return AppLoader();
        } else if (state.isError) {
          return Center(child: Text(state.asError.error));
        } else if (state.isData) {
          final cards = blocState.allFollowingCards;

          if (cards.isEmpty) return SizedBox();
          final followingCard = cards.elementAt(blocState.currentCardIdx).card;
          final followingCardWithAnswer = cards.elementAt(blocState.currentCardIdx);
          return Stack(
            children: [
              InfiniteScrollPage<CardWithAnswer>(
                onScroll: (page) {
                  bloc.add(ScrollCurrentPageEvent(pageIndex: page));
                },
                fetchNext: () {
                  bloc.add(FetchFollowingEvent());
                },
                data: cards,
                child: followingCard.accept(visitor,
                    props: ({
                      'showAnswer': blocState.showAnswer,
                      'selectedAnswer': followingCardWithAnswer.selectedAnswer
                    })),
                flipChild: followingCard.accept(visitor,
                    props: ({
                      'showAnswer': !blocState.showAnswer,
                      'selectedAnswer': followingCardWithAnswer.selectedAnswer
                    })),
              ),
              Positioned(
                  bottom: AppDimen.h48,
                  right: 0,
                  child: SideActionList(
                    avatarUrl: followingCard.user.avatar,
                    actions: [
                      SideActionButton(onTap: () {}, label: "87", icon: Assets.like.svg()),
                      SideActionButton(onTap: () {}, label: "2", icon: Assets.comments.svg()),
                      SideActionButton(onTap: () {}, label: "17", icon: Assets.share.svg()),
                      SideActionButton(onTap: () {}, label: "203", icon: Assets.bookmark.svg()),
                      SideActionButton(
                          onTap: () {
                            bloc.add(SelectAnswerCardEvent(cardId: null, answer: null));
                          },
                          label: "Flip",
                          icon: Assets.flip.svg()),
                    ],
                  )),
              Positioned(
                bottom: 0,
                child: PlayList(
                  topic: followingCard.description,
                  title: followingCard.playlist,
                  userCategory: followingCard.user.name,
                ),
              ),
            ],
          );
        } else {
          return SizedBox();
        }
      }),
    );
  }
}
