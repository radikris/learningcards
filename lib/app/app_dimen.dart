import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimen {
  AppDimen._();

  static final w16 = 16.w;
  static final w8 = 8.w;
  static final w4 = 4.w;
  static final w2 = 2.w;
  static final w10 = 10.w;
  static final w12 = 12.w;
  static final w24 = 24.w;
  static final w28 = 28.w;
  static final w32 = 32.w;
  static final w42 = 42.w;
  static final w45 = 45.w;
  static final w48 = 48.w;
  static final w64 = 64.w;
  static final w70 = 70.w;
  static final w75 = 75.w;
  static final w80 = 80.w;
  static final w85 = 85.w;
  static final w90 = 90.w;
  static final w95 = 95.w;
  static final w100 = 100.w;
  static final w105 = 105.w;
  static final w110 = 110.w;
  static final w120 = 120.w;
  static final w130 = 130.w;

  static final h16 = 16.h;
  static final h8 = 8.h;
  static final h4 = 4.h;
  static final h2 = 2.h;
  static final h10 = 10.h;
  static final h12 = 12.h;
  static final h24 = 24.h;
  static final h28 = 28.h;
  static final h32 = 32.h;
  static final h42 = 42.h;
  static final h45 = 45.h;
  static final h48 = 48.h;
  static final h64 = 64.h;
  static final h70 = 70.h;
  static final h75 = 75.h;
  static final h80 = 80.h;
  static final h85 = 85.h;
  static final h90 = 90.h;
  static final h95 = 95.h;
  static final h100 = 100.h;
  static final h105 = 105.h;
  static final h110 = 110.h;
  static final h120 = 120.h;
  static final h130 = 130.h;

  static final r2 = 2.r;
  static final r4 = 4.r;
  static final r8 = 8.r;
  static final r10 = 10.r;
  static final r12 = 12.r;
  static final r16 = 16.r;
  static final r24 = 24.r;

  static final commonShadow = BoxShadow(
    color: const Color(0xFF000000).withOpacity(0.4),
    offset: const Offset(1, 1),
    blurRadius: 1,
    spreadRadius: 0,
  );

  static final edge8 = EdgeInsets.symmetric(horizontal: AppDimen.w8, vertical: AppDimen.h8);
  static final edge4 = EdgeInsets.symmetric(horizontal: AppDimen.w4, vertical: AppDimen.h4);
  static final edge2 = EdgeInsets.symmetric(horizontal: AppDimen.w2, vertical: AppDimen.h2);
  static final edge16 = EdgeInsets.symmetric(horizontal: AppDimen.w16, vertical: AppDimen.h16);
  static final edgeh4v8 = EdgeInsets.symmetric(horizontal: AppDimen.w4, vertical: AppDimen.h8);
  static final edgeh8v16 = EdgeInsets.symmetric(horizontal: AppDimen.w8, vertical: AppDimen.h16);
  static final edgeh8v4 = EdgeInsets.symmetric(horizontal: AppDimen.w8, vertical: AppDimen.h4);
  static final edgeh16v8 = EdgeInsets.symmetric(horizontal: AppDimen.w16, vertical: AppDimen.h8);
  static final edgeh4 = EdgeInsets.symmetric(horizontal: AppDimen.w4);
  static final edgeh8 = EdgeInsets.symmetric(horizontal: AppDimen.w8);
  static final edgeh16 = EdgeInsets.symmetric(horizontal: AppDimen.w16);
  static final edgeh24 = EdgeInsets.symmetric(horizontal: AppDimen.w24);
  static final edgeh32 = EdgeInsets.symmetric(horizontal: AppDimen.w32);
  static final edgev2 = EdgeInsets.symmetric(vertical: AppDimen.h2);
  static final edgev4 = EdgeInsets.symmetric(vertical: AppDimen.h4);
  static final edgev8 = EdgeInsets.symmetric(vertical: AppDimen.h8);
  static final edgev16 = EdgeInsets.symmetric(vertical: AppDimen.h16);
  static final edgev24 = EdgeInsets.symmetric(vertical: AppDimen.h24);
  static final edgev32 = EdgeInsets.symmetric(vertical: AppDimen.h32);
}
