import 'package:flutter/material.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/app/app_dimen.dart';

class InfiniteScrollPage<T> extends StatefulWidget {
  const InfiniteScrollPage(
      {super.key,
      required this.fetchNext,
      required this.child,
      required this.flipChild,
      required this.data,
      required this.onScroll,
      this.initialPage});

  final Function fetchNext;
  final Function(int idx) onScroll;
  final Widget child;
  final Widget flipChild;
  final List<T> data;
  final int? initialPage;

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
    /* if (widget.initialPage != null && currentPage != widget.initialPage) {
      _pageController!.jumpToPage(widget.initialPage!);
    } */
  }

  void _scrollListener() {
    if (_pageController!.position.pixels == _pageController!.position.maxScrollExtent) {
      //_fetchData();
    }
  }

  Future<void> _fetchData() async {
    /*  setState(() {
      isLoading = true;
    }); */
    widget.fetchNext();
  }

  void onPageChanged(int newPage) {
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
