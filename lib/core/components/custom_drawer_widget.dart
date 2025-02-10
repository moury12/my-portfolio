import 'package:flutter/material.dart';
import 'package:protfolio/core/constant/custom_space.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/utils/constant_variable.dart';
import 'package:protfolio/views/widget/drawer_card_widget.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: responsivePadding12(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: List.generate(
            drawerList.length,
            (index) => Column(
              children: [
                DrawerCardWidget(
                  index: index,
                ),
                responsiveSpace12H(context),
                Divider()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
