import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/screen_helper.dart';
import 'package:protfolio/core/utils/constant_variable.dart';
import 'package:protfolio/views/widget/drawer_card_widget.dart';
class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          child: Row(
            spacing: 6,
            children: [
              Text(
                'Sadia',
                style: TextStyle(
                  fontSize: responsiveFontSize16(context),
                  fontFamily: 'ProtestRiot',
                  fontWeight: FontWeight.w400,
                  color: AppColors.kTextColor,
                ),
              ),
              Text(
                'Bennthe',
                style: TextStyle(
                    fontSize: responsiveFontSize16(context),
                    fontFamily: 'ProtestRiot',
                    fontWeight: FontWeight.w400,
                    color: AppColors.kPrimaryColor,
                    shadows: [
                      Shadow(
                          color: AppColors.kPrimaryColor,
                          blurRadius: 9)
                    ]),
              ),
            ],
          ),
        ),
        // Spacer(),
        ScreenHelper.isMobile(context)
            ? Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                _scaffoldKey.currentState!.openEndDrawer();
              },
              icon: Icon(
                Icons.menu,
                color: AppColors.kTextColor,
                size: 20,
              ));
        })
            : Row(
          spacing: ScreenHelper.isMobile(context)?12:16,
          children: List.generate(
            drawerList.length,
                (index) => DrawerCardWidget(
              index: index,
            ),
          ),
        )
      ],
    );
  }
}
