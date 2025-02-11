import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/constant/image_constant.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

class SocialMediaIconWidget extends StatefulWidget {
  final String icon;
  const SocialMediaIconWidget({
    super.key,
    required this.icon,
  });

  @override
  State<SocialMediaIconWidget> createState() => _SocialMediaIconWidgetState();
}

class _SocialMediaIconWidgetState extends State<SocialMediaIconWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: padding8,
        padding: padding6,
        decoration: BoxDecoration(
          color: Colors.black,
            boxShadow: [
          BoxShadow(color: isHovered?AppColors.kPrimaryColor:Colors.transparent,
          blurRadius: 20)
        ],
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.kPrimaryColor, width: 1.5)),
        child: Image.asset(
          fit: BoxFit.contain,
          widget.icon,
          height: ScreenHelper.isMobile(context)
              ? 15
              : ScreenHelper.isTablet(context)
                  ? 18
                  : 22,
          width: ScreenHelper.isMobile(context)
              ? 15
              : ScreenHelper.isTablet(context)
                  ? 18
                  : 22,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
