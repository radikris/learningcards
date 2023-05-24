import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/app/app_util.dart';
import 'package:learningcards/features/common/application/timer_cubit.dart';
import 'package:learningcards/gen/assets.gen.dart';

class ElapsedTimeUsage extends StatelessWidget {
  const ElapsedTimeUsage({super.key});

  @override
  Widget build(BuildContext context) {
    final time = context.watch<TimerCubit>().state;
    final textTheme = context.textTheme;
    return Container(
      margin: EdgeInsets.only(left: AppDimen.w8),
      width: AppDimen.w70,
      child: Row(
        children: [
          Assets.timer.svg(),
          SizedBox(
            width: AppDimen.w4,
          ),
          Flexible(
            child: Text(
              AppUtil.formatTime(time),
              style: textTheme.bodySmall!.copyWith(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
