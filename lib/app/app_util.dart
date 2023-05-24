class AppUtil {
  static String formatTime(int minutes) {
    if (minutes < 60) {
      return '$minutes' 'm';
    } else {
      int hours = minutes ~/ 60;
      int remainingMinutes = minutes % 60;
      return '$hours' 'h ' '$remainingMinutes' 'm';
    }
  }
}
