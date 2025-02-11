import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/components/custom_text.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';

class ProtfolioTitleWidget extends StatelessWidget {
  final String title;
  const ProtfolioTitleWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title,
      style: poppinsBold.copyWith(
          fontSize: responsiveFontSize24(context), color: AppColors.kTextColor),
    );
  }
}
