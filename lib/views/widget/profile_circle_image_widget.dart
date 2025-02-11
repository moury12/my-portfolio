import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/constant/screen_helper.dart';

class ProfileCircleImage extends StatefulWidget {
  const ProfileCircleImage({
    super.key,
  });

  @override
  State<ProfileCircleImage> createState() => _ProfileCircleImageState();
}

class _ProfileCircleImageState extends State<ProfileCircleImage> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(

          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            BoxShadow(
              color: isHovered
                  ? AppColors.kPrimaryColor // Brighter on hover
                  : AppColors.kPrimaryColor.withOpacity(0.8), // Normal state
              blurRadius: isHovered ? 30 : 20,
            )
          ]),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            'assets/images/profile_img.jpg',
            height:ScreenHelper.isMobile(context)
                ? 200
                : ScreenHelper.isTablet(context)
                    ? 250
                    : 400,
          )),
    );
  }
}
