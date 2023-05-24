import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<int> {
  TimerCubit() : super(0) {
    _startTimer();
  }

  Timer? _timer;
  int _elapsedMinutes = 0;

  void _startTimer() {
    _timer = Timer.periodic(Duration(minutes: 1), (_) {
      _elapsedMinutes++;
      emit(_elapsedMinutes);
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
