import 'package:flutter/material.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

double responsiveFontSize10(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 10
        : ScreenHelper.isTablet(context)
        ? 12
        : 14;
double responsiveFontSize8(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 8
        : ScreenHelper.isTablet(context)
        ? 10
        : 12;
double responsiveFontSize12(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 12
        : ScreenHelper.isTablet(context)
        ? 16
        : 20;
double responsiveFontSize16(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 16
        : ScreenHelper.isTablet(context)
        ? 20
        : 24;
double responsiveFontSize24(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? 24
        : ScreenHelper.isTablet(context)
        ? 28
        : 32;
