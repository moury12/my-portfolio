import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/components/custom_text.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';
import 'package:protfolio/core/utils/constant_variable.dart';
import 'package:protfolio/views/home_page.dart';

class DrawerCardWidget extends StatelessWidget {
  final int index;
  const DrawerCardWidget({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
        text: drawerList[index]['text'],
        style: poppinsSemiBold,
        fontSize: responsiveFontSize10(context));
  }
}