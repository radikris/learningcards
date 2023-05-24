import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';

class SideActionButton extends StatelessWidget {
  const SideActionButton({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
  });

  final Function onTap;
  final String label;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = context.textTheme;
    return Padding(
      padding: EdgeInsets.only(bottom: AppDimen.h8),
      child: InkWell(
          onTap: () {
            onTap.call();
          },
          child: Column(children: [
            icon,
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: theme.labelMedium,
            )
          ])),
    );
  }
}
