import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/application/bloc_state.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/common/presentation/app_loader.dart';
import 'package:learningcards/features/common/presentation/infinite_scroll_page.dart';
import 'package:learningcards/features/common/presentation/play_list.dart';
import 'package:learningcards/features/common/presentation/side_action_list.dart';
import 'package:learningcards/features/following/application/bloc/following_bloc.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/following/presentation/following_back.dart';
import 'package:learningcards/features/following/presentation/following_front.dart';
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
  List<dynamic> data = [];
  int currentPage = 1;
  bool isLoading = false;
  PageController? _pageController;
  final CardVisitor<Widget> visitor = CardWidgetVisitor();

  @override
  void initState() {
    super.initState();
    _fetchData();
    _pageController = PageController();
    _pageController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_pageController!.position.pixels == _pageController!.position.maxScrollExtent) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      final apiUrl = 'https://your-api-endpoint.com/data?page=$currentPage';

      try {
        // final response = await http.get(Uri.parse(apiUrl));
        final response = ['data', 'data2', 'data3'];
        //final jsonData = json.decode(response);

        setState(() {
          data.addAll(response);
          currentPage++;
          isLoading = false;
        });
      } catch (error) {
        // Handle error
        print('Error fetching data: $error');
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FollowingBloc>();
    final state = context.watch<FollowingBloc>().state.state;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Builder(builder: (context) {
        if (state.isLoading) {
          return AppLoader();
        } else if (state.isError) {
          return Center(child: Text(state.asError.error));
        } else if (state.isData) {
          final card = state.asData.data;
          final followingCard = card.allFollowingCards.last;
          return Stack(
            children: [
              InfiniteScrollPage<CardBaseModel>(
                fetchNext: () {
                  bloc.add(FetchFollowingEvent());
                },
                data: card.allFollowingCards,
                child: followingCard.accept(visitor, props: ({'showAnswer': false})),
                flipChild: followingCard.accept(visitor, props: ({'showAnswer': true})),
              ),
              Positioned(bottom: AppDimen.h42, right: 0, child: SideActionList(avatarUrl: followingCard.user.avatar)),
              Positioned(
                bottom: 0,
                child: PlayList(
                  topic: followingCard.description,
                  title: followingCard.playlist,
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

  Widget _buildItem(dynamic item) {
    return Container(
      // Customize how each item is displayed
      child: Center(
        child: Text(item.toString()),
      ),
    );
  }

  Widget _buildLoader() {
    return Container(
      height: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
