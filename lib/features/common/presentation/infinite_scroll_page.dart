import 'package:flutter/material.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/features/common/presentation/app_loader.dart';

class InfiniteScrollPage<T> extends StatefulWidget {
  const InfiniteScrollPage({required this.fetchNext, required this.child, required this.flipChild, required this.data});

  final Function fetchNext;
  final Widget child;
  final Widget flipChild;
  final List<T> data;

  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  int currentPage = 1;
  bool isLoading = false;
  bool isFlip = false;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    // _fetchData();
    _pageController = PageController();
    _pageController!.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void _scrollListener() {
    if (_pageController!.position.pixels == _pageController!.position.maxScrollExtent) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    /*  setState(() {
      isLoading = true;
    }); */
    widget.fetchNext();

    setState(() {
      currentPage++; //TODO IF BACKEND WOULD HAVE PAGINATION FOR BATCH FETCH (PREFETCH)
    });
  }

  void onFlip() {
    setState(() {
      isFlip = !isFlip;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: widget.data.length + 1,
        itemBuilder: (context, index) {
          if (isLoading) return AppLoader();
          return Padding(
              padding: EdgeInsets.only(left: AppDimen.w16, right: AppDimen.w48),
              child: GestureDetector(
                onTap: onFlip,
                child: Center(
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300), child: isFlip ? widget.flipChild : widget.child),
                ),
              ));
        },
      ),
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
}
