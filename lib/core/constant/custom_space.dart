import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

SizedBox space24H = SizedBox(height: 24);
SizedBox space20H = SizedBox(height: 20);
SizedBox space50H = SizedBox(height: 50);
SizedBox space20W = SizedBox(width: 20);
SizedBox space16H = SizedBox(height: 16);
SizedBox space12H = SizedBox(height: 12);
SizedBox space8H = SizedBox(height: 8);
SizedBox space4H = SizedBox(height: 4);
SizedBox space6H = SizedBox(height: 6);
SizedBox space24W = SizedBox(width: 24);
SizedBox space40W = SizedBox(width: 40);
SizedBox space60W = SizedBox(width: 60);
SizedBox space16W = SizedBox(width: 16);
SizedBox space12W = SizedBox(width: 12);
SizedBox space8W = SizedBox(width: 8);
SizedBox space6W = SizedBox(width: 6);
SizedBox responsiveSpace12H(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? space12H
        : ScreenHelper.isTablet(context)
            ? space16H
            : space20H;
SizedBox responsiveSpace12w(BuildContext context) =>
    ScreenHelper.isMobile(context)
        ? space12W
        : ScreenHelper.isTablet(context)
            ? space16W
            : space20W;
double spaceing16(BuildContext context) => ScreenHelper.isMobile(context) ||
        ScreenHelper.isTablet(context) ||
        ScreenHelper.isSmallTablet(context)
    ? 16
    : 16.sp;
double spaceing12(BuildContext context) => ScreenHelper.isMobile(context)
    ? 12
    : ScreenHelper.isTablet(context) || ScreenHelper.isSmallTablet(context)
        ? 16
        : 16.sp;
