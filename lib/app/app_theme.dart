import 'package:flutter/material.dart';
import 'package:learningcards/app/app_dimen.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: const Color(0xFF00425A),
  secondaryHeaderColor: const Color(0xFFFFFFFF).withOpacity(0.2),
  cardColor: const Color(0xFFFFFFFF).withOpacity(0.2),
  textTheme: TextTheme(
    bodyLarge: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 21,
      height: 1.2,
    ),
    bodyMedium: TextStyle(
      color: const Color(0xFFFFFFFF).withOpacity(0.7),
      fontSize: 17,
      height: 1.18,
    ),
    labelLarge: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 18,
      height: 1.2,
    ),
    bodySmall: TextStyle(
      color: const Color(0xFFFFFFFF).withOpacity(0.6),
      fontSize: 14,
      height: 1.16,
    ),
    labelSmall: const TextStyle(
      color: Color(0xFFFFFFFF),
      fontSize: 10,
      height: 1.2,
    ),
    labelMedium: TextStyle(
        color: const Color(0xFFFFFFFF),
        fontSize: 12,
        height: 1.18,
        letterSpacing: -0.1,
        shadows: [AppDimen.commonShadow]),
  ),
  disabledColor: const Color(0xFFFFFFFF).withOpacity(0.4),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF000000),
  ),
  extensions: const [
    AppColors.light,
  ],
);

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    this.button,
    this.text,
    this.disabled,
    this.black,
    this.white,
    this.gray,
    this.score1,
    this.score2,
    this.score3,
    this.score4,
    this.score5,
    this.background,
    this.success,
    this.failure,
  });

  final Color? success;
  final Color? failure;
  final Color? button;
  final Color? text;
  final Color? disabled;
  final Color? black;
  final Color? white;
  final Color? gray;
  final Color? score1;
  final Color? score2;
  final Color? score3;
  final Color? score4;
  final Color? score5;
  final LinearGradient? background;

  @override
  ThemeExtension<AppColors> copyWith({
    Color? success,
    Color? failure,
    Color? button,
    Color? text,
    Color? disabled,
    Color? black,
    Color? white,
    Color? gray,
    Color? score1,
    Color? score2,
    Color? score3,
    Color? score4,
    Color? score5,
    LinearGradient? background,
  }) {
    return AppColors(
        success: success ?? this.success,
        failure: failure ?? this.failure,
        button: button ?? this.button,
        text: text ?? this.text,
        disabled: disabled ?? this.disabled,
        black: black ?? this.black,
        white: white ?? this.white,
        gray: gray ?? this.gray,
        score1: score1 ?? this.score1,
        score2: score2 ?? this.score2,
        score3: score3 ?? this.score3,
        score4: score4 ?? this.score4,
        score5: score5 ?? this.score5,
        background: background ?? this.background);
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
        success: Color.lerp(success, other.success, t),
        failure: Color.lerp(failure, other.failure, t),
        button: Color.lerp(button, other.button, t),
        text: Color.lerp(text, other.text, t),
        disabled: Color.lerp(disabled, other.disabled, t),
        black: Color.lerp(black, other.black, t),
        white: Color.lerp(white, other.white, t),
        gray: Color.lerp(gray, other.gray, t),
        score1: Color.lerp(score1, other.score1, t),
        score2: Color.lerp(score2, other.score2, t),
        score3: Color.lerp(score3, other.score3, t),
        score4: Color.lerp(score4, other.score4, t),
        score5: Color.lerp(score5, other.score5, t),
        background: LinearGradient.lerp(background, other.background, t));
  }

  @override
  String toString() {
    return 'AppColors(success: $success, failure: $failure)';
  }

  static const light = AppColors(
    success: Color(0xFF28B18F),
    failure: Color(0xFFDC5F5F),
    button: Color(0xFFFFFFFF),
    black: Color(0xFF000000),
    disabled: Color(0x66FFFFFF),
    text: Color(0xFFFFFFFF),
    white: Color(0xFFFFFFFF),
    gray: Color(0xFF161616),
    score1: Color(0xFFF17D23),
    score2: Color(0xFFFBB668),
    score3: Color(0xFFFFD449),
    score4: Color(0xFF16624F),
    score5: Color(0xFF1F8A70),
    background: LinearGradient(
      colors: [
        Color(0xFF002634),
        Color(0xFF00425A),
      ],
    ),
  );

  //TODO MAKE IT LIGHT AND DARK MODE COMPATIBLE WITH GOOD ACCESSIBILITY RATES
  static const dark = AppColors(
    success: Color.fromARGB(255, 22, 232, 40),
    failure: Color.fromARGB(255, 205, 127, 18),
    button: Colors.blue,
    text: Colors.white,
    disabled: Colors.grey,
    black: Colors.black,
    white: Colors.white,
    gray: Colors.grey,
    score1: Colors.red,
    score2: Colors.green,
    score3: Colors.blue,
    score4: Colors.orange,
    score5: Colors.purple,
    background: LinearGradient(
      colors: [
        Color(0xFF002634),
        Color(0xFF00425A),
      ],
    ),
  );
}
