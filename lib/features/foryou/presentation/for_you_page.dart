import 'dart:convert';
import 'package:flutter/material.dart';

class ForYouPage extends StatefulWidget {
  @override
  _ForYouPageState createState() => _ForYouPageState();
}

class _ForYouPageState extends State<ForYouPage> {
  List<dynamic> data = [];
  int currentPage = 1;
  bool isLoading = false;
  PageController? _pageController;

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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: data.length + 1,
        itemBuilder: (context, index) {
          if (index == data.length) {
            return _buildLoader();
          } else {
            final item = data[index];
            return _buildItem(item);
          }
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

  Widget _buildLoader() {
    return Container(
      height: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
