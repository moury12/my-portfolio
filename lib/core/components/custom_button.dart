import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/constant/custom_space.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.height,
      this.width = double.maxFinite,
      required this.onTap,
      this.title = '',
      this.marginVerticel = 0,
      this.marginHorizontal = 0,
      this.fillColor = AppColors.kPrimaryColor,
      this.textColor =Colors.black,
      this.borderColor = AppColors.kPrimaryColor,
      this.child,
      this.img,
      this.icon,
      this.fontSize,
      this.radius,
      this.isLoading = false,  this.shadowColor=Colors.transparent, this.blurRadius});

  final double? height;
  final double? radius;
  final double width;
  final Color fillColor;
  final Color shadowColor;
  final Color borderColor;
  final bool? isLoading;

  final Color textColor;

  final VoidCallback onTap;

  final String title;
  final Widget? child;
  final String? img;
  final IconData? icon;

  final double marginVerticel;
  final double? fontSize;
  final double? blurRadius;
  final double marginHorizontal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading == true
          ? () {}
          : () {
              onTap();
            },
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVerticel, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        padding: padding8 ,

        decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: shadowColor, blurRadius: blurRadius ?? 0)],
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(radius ?? 20),
          color: fillColor,
        ),
        child: isLoading == true
            ? const DefaultProgressIndicator(
          strokeWidth: 2,
        )
            : IntrinsicWidth(  // Ensures the button width adjusts to its content
          child: Row(
            mainAxisSize: MainAxisSize.min, // Makes width dynamic
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: poppinsSemiBold.copyWith(
                    color: textColor,
                    fontSize: fontSize ?? responsiveFontSize10(context)),
              ),
              if (icon != null || img != null) space8W,
              if (img != null)
                Image.asset(
                  img!,
                  height: 24,
                  width: 24,
                  color: Colors.black,
                )
              else if (icon != null)
                Icon(
                  icon,
                  size: 24,
                ),
            ],
          ),
        ),
      )
      ,
    );
  }
}

class DefaultProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;
  const DefaultProgressIndicator({
    super.key,
    this.color,
    this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( height: 15,
      width: 15,
      child: CircularProgressIndicator(
        color: color ?? Colors.black,
        strokeWidth: strokeWidth ?? 2,
      ),
    );
  }
}
