import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/following/application/bloc/following_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingBack extends StatelessWidget {
  final String question;
  final String answer;
  const FollowingBack({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;
    final bloc = context.read<FollowingBloc>();
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: AppDimen.h10,
            ),
            Text(
              question,
              style: textTheme.bodyLarge,
            ),
            SizedBox(
              height: AppDimen.h10,
            ),
            Divider(
              thickness: AppDimen.h4,
              color: colors.disabled,
            ),
            SizedBox(
              height: AppDimen.h10,
            ),
            Text(
              'Answer',
              style: textTheme.bodySmall!.copyWith(color: colors.success!, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: AppDimen.h4,
            ),
            Text(
              answer,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        Positioned(
          bottom: AppDimen.h100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How well did you know this?',
                style: textTheme.bodySmall,
              ),
              SizedBox(
                height: AppDimen.h10,
              ),
              SizedBox(
                  height: AppDimen.h45,
                  width: context.screenSize.width - AppDimen.w100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: FlashcardFeedbackEnum.values
                          .map((e) => GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: AppDimen.h45,
                                  width: AppDimen.w45,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimen.r12),
                                    color: e.toColor(context),
                                  ),
                                  child: Center(child: Text(e.toValue.toString())),
                                ),
                              ))
                          .toList())),
            ],
          ),
        ),
      ],
    );
  }
}
