import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/components/custom_text.dart';
import 'package:protfolio/core/constant/custom_space.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';
import 'package:protfolio/models/time_line_model.dart';

class ExperceniceEducationTimeLineItem extends StatefulWidget {
  final TimelineEvent timelineModel;
  final bool isLeft;
  const ExperceniceEducationTimeLineItem({
    super.key,
    required this.timelineModel,
    required this.isLeft,
  });

  @override
  State<ExperceniceEducationTimeLineItem> createState() => _ExperceniceEducationTimeLineItemState();
}

class _ExperceniceEducationTimeLineItemState extends State<ExperceniceEducationTimeLineItem> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding12H(context),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment:
            widget.isLeft ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          space12H,
          CustomText(
            text: widget.timelineModel.year,
            style: poppinsSemiBold,
            fontSize: responsiveFontSize10(context),
          ),
          MouseRegion(
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: AnimatedContainer(
              duration: Duration(
                milliseconds: 300,
              ),
              padding: padding12(context),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius:
                      BorderRadius.circular(responsiveRadius50(context)),
                  border: Border.all(
                    color: AppColors.kPrimaryColor,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isHovered?AppColors.kPrimaryColor:AppColors.kPrimaryColor.withOpacity(.7),
                      blurRadius:isHovered?15: 8,
                    ),
                  ]),
              child: Column(
                spacing: 12.h ,
                crossAxisAlignment:/* isLeft ? CrossAxisAlignment.end : */CrossAxisAlignment.start,
                children: [
                  CustomText(text: widget.timelineModel.title,style: poppinsBold,fontSize: responsiveFontSize12(context),),
                  CustomText(text: widget.timelineModel.description,style: poppinsRegular,
                    fontSize: responsiveFontSize8(context),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
