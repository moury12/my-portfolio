import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/constant/custom_space.dart';
import 'package:protfolio/core/constant/screen_helper.dart';
import 'package:protfolio/core/utils/constant_variable.dart';


import 'widget/education_experience_timeline_list.dart';
import 'widget/portfolioTitleWidget.dart';
class EducationExperiencePart extends StatelessWidget {
  const EducationExperiencePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(spacing:ScreenHelper.isDesktop(context)? 20.h:30,
      children: [

    FullHeightSizedBoxWidget(
      child: Column(
        children: [
          ProtfolioTitleWidget(
            title: "Education",
          ),
          responsiveSpace12H(context),
          responsiveSpace12H(context),
          EducationTimeLineWidget(timeLineList: educationList,) ,
        ],
      ),
    ),
       /* responsiveSpace12H(context),
        responsiveSpace12H(context),*/
       FullHeightSizedBoxWidget(child: Column(
         children: [
           ProtfolioTitleWidget(
             title: "Experience",
           ),
           responsiveSpace12H(context),
           responsiveSpace12H(context),
           EducationTimeLineWidget(timeLineList: experienceList,)
         ],
       ),)
      ],
    );
  }
}

class FullHeightSizedBoxWidget extends StatelessWidget {
  final Widget child;
  const FullHeightSizedBoxWidget({
    super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox( height: ScreenHelper.isDesktop(context)&&MediaQuery.sizeOf(context).height<MediaQuery.sizeOf(context).width
        ? MediaQuery.of(context).size.height * 0.9
        : null,
      child:child
    );
  }
}


