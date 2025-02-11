import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

double responsiveFontSize10(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 10
        : ScreenHelper.isSmallTablet(context)
        ? 12: ScreenHelper.isTablet(context)
        ? 14
        : 16.sp;
double responsiveFontSize8(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 8
        : ScreenHelper.isSmallTablet(context)
        ? 10:ScreenHelper.isTablet(context)
        ? 12
        : 14.sp;
double responsiveFontSize12(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 12
        : ScreenHelper.isSmallTablet(context)
        ? 14: ScreenHelper.isTablet(context)
        ? 16
        : 20.sp;
double responsiveFontSize16(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 16
        : ScreenHelper.isSmallTablet(context)
        ? 18: ScreenHelper.isTablet(context)
        ? 20
        : 24.sp;
double responsiveFontSize24(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 24
        : ScreenHelper.isSmallTablet(context)
        ? 28: ScreenHelper.isTablet(context)
        ? 30
        : 32.sp;
