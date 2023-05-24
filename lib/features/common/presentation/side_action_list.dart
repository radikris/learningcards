import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/presentation/side_action_button.dart';
import 'package:learningcards/gen/assets.gen.dart';

class SideActionList extends StatelessWidget {
  SideActionList({super.key, required this.avatarUrl, required this.actions});
  final String avatarUrl;

  final List<SideActionButton> actions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: AppDimen.w10),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                backgroundColor: context.appColors.white,
                radius: AppDimen.w16 + 2,
                child: CircleAvatar(
                  radius: AppDimen.w16,
                  child: Image.network(
                    avatarUrl,
                  ),
                ),
              ),
              Positioned(bottom: -AppDimen.h4, left: 0, right: 0, child: Assets.plus.svg())
            ],
          ),
          SizedBox(
            height: AppDimen.h10,
          ),
          Column(
            children: actions,
          ),
        ],
      ),
    );
  }
}
