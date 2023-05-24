import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/presentation/elapsed_time.dart';
import 'package:learningcards/features/common/presentation/play_list.dart';
import 'package:learningcards/features/common/presentation/search_bar.dart';
import 'package:learningcards/features/common/presentation/side_action_list.dart';
import 'package:learningcards/features/following/presentation/following_page.dart';
import 'package:learningcards/features/foryou/presentation/for_you_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.appTheme;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: SizedBox(
          width: AppDimen.w110 * 2,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 5.0, color: Colors.white), insets: AppDimen.edgeh32),
            controller: _tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 2.0,
            tabs: [
              Tab(child: Text('Following', style: theme.textTheme.labelLarge)),
              Tab(
                  child: Text(
                'For You',
                style: theme.textTheme.labelLarge,
              )),
            ],
          ),
        ),
        centerTitle: true,
        leading: ElapsedTimeUsage(),
        actions: [AppSearchBar()],
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              FollowingPage(),
              ForYouPage(),
            ],
          ),
        ],
      ),
    );
  }
}
