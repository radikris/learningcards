import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/gen/assets.gen.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimen.w8),
      child: Assets.search.svg(),
    );
  }
}
