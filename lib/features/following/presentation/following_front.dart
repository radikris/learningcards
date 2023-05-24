import 'package:flutter/material.dart';
import 'package:learningcards/app/app_extensions.dart';

class FollowingFront extends StatelessWidget {
  final String question;
  const FollowingFront({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Text(
      question,
      style: textTheme.bodyLarge,
    );
  }
}
