import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/features/common/presentation/app_loader.dart';
import 'package:learningcards/features/following/application/bloc/following_bloc.dart';

class InfiniteScrollPage<T> extends StatefulWidget {
  const InfiniteScrollPage(
      {required this.fetchNext,
      required this.child,
      required this.flipChild,
      required this.data,
      required this.onScroll});

  final Function fetchNext;
  final Function(int idx) onScroll;
  final Widget child;
  final Widget flipChild;
  final List<T> data;

  @override
  _InfiniteScrollPageState createState() => _InfiniteScrollPageState();
}

class _InfiniteScrollPageState extends State<InfiniteScrollPage> {
  int currentPage = 0;
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
    //_pageController!.jumpToPage(currentPage);
  }

  void _scrollListener() {
    if (_pageController!.position.pixels == _pageController!.position.maxScrollExtent) {
      //_fetchData();
      print("VEGE");
    }
  }

  Future<void> _fetchData() async {
    /*  setState(() {
      isLoading = true;
    }); */
    widget.fetchNext();
  }

  void onPageChanged(int newPage) {
    print(newPage);
    setState(() {
      currentPage = newPage; //TODO IF BACKEND WOULD HAVE PAGINATION FOR BATCH FETCH (PREFETCH)
      isFlip = false;
    });
    widget.onScroll(newPage);
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
        onPageChanged: onPageChanged,
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          if (index == widget.data.length - AppConstants.PRELOAD_PAGE) {
            //PREFETCH
            _fetchData();
          }

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
}
