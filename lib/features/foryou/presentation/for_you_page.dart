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
import 'package:learningcards/features/foryou/application/bloc/for_you_bloc.dart';
import 'package:learningcards/gen/assets.gen.dart';
import 'package:learningcards/injectable.dart';

class ForYouPage extends StatelessWidget {
  const ForYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForYouBloc>(
      create: (context) => getIt<ForYouBloc>()..add(FetchForYouEvent()),
      child: ForYouView(),
    );
  }
}

class ForYouView extends StatefulWidget {
  @override
  _ForYouViewState createState() => _ForYouViewState();
}

class _ForYouViewState extends State<ForYouView> {
  final CardVisitor<Widget> visitor = CardWidgetVisitor();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ForYouBloc>();
    final blocState = context.watch<ForYouBloc>().state;
    final state = blocState.state;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        if (state.isLoading) {
          return AppLoader();
        } else if (state.isError) {
          return Center(child: Text(state.asError.error));
        } else if (state.isData) {
          final cards = blocState.allForYouCards;

          if (cards.isEmpty) return SizedBox();
          final forYouCard = cards.elementAt(blocState.currentCardIdx).card;
          final forYouCardWithAnswer = cards.elementAt(blocState.currentCardIdx);

          final child = forYouCard.accept(visitor,
              props: ({
                'showAnswer': blocState.showAnswer || forYouCardWithAnswer.correctAnswer != null,
                'selectedAnswer': forYouCardWithAnswer.selectedAnswer,
                'correctAnswers': forYouCardWithAnswer.correctAnswer
              }));

          return Stack(
            children: [
              InfiniteScrollPage<CardWithMultipleChoice>(
                initialPage: blocState.currentCardIdx,
                onScroll: (page) {
                  bloc.add(ScrollCurrentPageEvent(pageIndex: page));
                },
                fetchNext: () {
                  bloc.add(FetchForYouEvent());
                },
                data: cards,
                child: child,
                flipChild: child,
              ),
              Positioned(
                  bottom: AppDimen.h48,
                  right: 0,
                  child: SideActionList(
                    avatarUrl: forYouCard.user.avatar,
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
                  topic: forYouCard.description,
                  title: forYouCard.playlist,
                  userCategory: forYouCard.user.name,
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
