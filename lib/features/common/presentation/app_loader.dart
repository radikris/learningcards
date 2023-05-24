import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
