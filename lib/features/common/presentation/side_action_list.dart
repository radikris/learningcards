import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/presentation/side_action_button.dart';
import 'package:learningcards/gen/assets.gen.dart';

class SideActionList extends StatelessWidget {
  SideActionList({super.key, required this.avatarUrl});
  final String avatarUrl;

  final actions = [
    SideActionButton(onTap: () {}, label: "87", icon: Assets.like.svg()),
    SideActionButton(onTap: () {}, label: "2", icon: Assets.comments.svg()),
    SideActionButton(onTap: () {}, label: "17", icon: Assets.share.svg()),
    SideActionButton(onTap: () {}, label: "203", icon: Assets.bookmark.svg()),
    SideActionButton(onTap: () {}, label: "Flip", icon: Assets.flip.svg()),
  ];

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
