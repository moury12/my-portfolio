import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

EdgeInsets padding16 = EdgeInsets.all(16);
EdgeInsets padding20 = EdgeInsets.all(20);
EdgeInsets padding12(BuildContext context) =>
    EdgeInsets.all(ScreenHelper.isMobile(context)
        ? 12
        : ScreenHelper.isSmallTablet(context)
            ? 14
            : ScreenHelper.isTablet(context)
                ? 16
                : 16.sp);
EdgeInsets padding12H(BuildContext context) =>
    EdgeInsets.symmetric(horizontal:ScreenHelper.isMobile(context)
        ? 12
        : ScreenHelper.isSmallTablet(context)
            ? 14
            : ScreenHelper.isTablet(context)
                ? 16
                : 16.sp);
EdgeInsets padding8(BuildContext context) =>
    EdgeInsets.all(ScreenHelper.isMobile(context)
        ? 8
        : ScreenHelper.isSmallTablet(context)
            ? 10
            : ScreenHelper.isTablet(context)
                ? 12
                : 12.sp);
EdgeInsets padding6(BuildContext context) =>
    EdgeInsets.all(ScreenHelper.isMobile(context)
        ? 6
        : ScreenHelper.isSmallTablet(context)
            ? 10
            : ScreenHelper.isTablet(context)
                ? 10
                : 8.sp);

EdgeInsets padding4 = EdgeInsets.all(4);
EdgeInsets padding14 = EdgeInsets.all(14);
EdgeInsets padding24 = EdgeInsets.all(24);
EdgeInsets padding16H = EdgeInsets.symmetric(horizontal: 16);
EdgeInsets padding12T = EdgeInsets.only(top: 12);
EdgeInsets padding6T = EdgeInsets.only(top: 6);
EdgeInsets padding16V = EdgeInsets.symmetric(vertical: 16);
EdgeInsets padding14H = EdgeInsets.symmetric(horizontal: 14);
EdgeInsets padding14V = EdgeInsets.symmetric(vertical: 14);
EdgeInsets padding12V = EdgeInsets.symmetric(vertical: 12);
EdgeInsets padding6H = EdgeInsets.symmetric(horizontal: 6);
EdgeInsets padding6V = EdgeInsets.symmetric(vertical: 6);
EdgeInsets padding4V = EdgeInsets.symmetric(vertical: 4);
EdgeInsets padding16b24 = EdgeInsets.all(16).copyWith(bottom: 24);
EdgeInsets paddingH16V6 = EdgeInsets.symmetric(horizontal: 16, vertical: 6);
