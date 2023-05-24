import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/gen/assets.gen.dart';

class PlayList extends StatelessWidget {
  final String title;
  final String topic;
  const PlayList({super.key, required this.title, required this.topic});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final theme = context.appTheme;
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: AppDimen.w16, right: AppDimen.w48),
          child: Text(
            topic,
            style: textTheme.bodySmall!.copyWith(color: colors.white),
          ),
        ),
        SizedBox(
          height: AppDimen.h10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: AppDimen.edge16,
          color: colors.gray!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Assets.playlist.svg(),
                  SizedBox(
                    width: AppDimen.w4,
                  ),
                  Text(
                    "Playlist • $title",
                    style: theme.textTheme.bodySmall!.copyWith(color: colors.white),
                  ),
                ],
              ),
              Assets.rightArrow.svg()
            ],
          ),
        ),
      ],
    );
  }
}
