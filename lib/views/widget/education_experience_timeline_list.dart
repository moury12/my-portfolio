import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/models/time_line_model.dart';
import 'package:protfolio/views/widget/experience_education_timeline_item_widget.dart';
import 'package:timelines_plus/timelines_plus.dart';
class EducationTimeLineWidget extends StatefulWidget {
  final List<TimelineEvent> timeLineList;
  const EducationTimeLineWidget({
    super.key, required this.timeLineList,
  });

  @override
  State<EducationTimeLineWidget> createState() => _EducationTimeLineWidgetState();
}

class _EducationTimeLineWidgetState extends State<EducationTimeLineWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      initialItemCount: widget.timeLineList.length,
      itemBuilder: (context, index, animation) {
        bool isLeft = index.isEven;
        return TimelineTile(
          oppositeContents: isLeft
              ? ExperceniceEducationTimeLineItem(
            timelineModel: widget.timeLineList[index],
            isLeft: isLeft,
          )
              : SizedBox.shrink(),
          contents: !isLeft
              ? ExperceniceEducationTimeLineItem(
            timelineModel: widget.timeLineList[index],
            isLeft: isLeft,
          )
              : SizedBox.shrink(),
          node: TimelineNode(indicatorPosition: .1 ,
            indicator: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.kPrimaryColor,
                        blurRadius: 10,
                        spreadRadius: 3)
                  ],
                  color: AppColors.kPrimaryColor,
                  shape: BoxShape.circle),
            ),
            startConnector: SolidLineConnector(
              color: AppColors.kPrimaryColor,
            ),
            endConnector: SolidLineConnector(
              color: AppColors.kPrimaryColor,
            ),
          ),
        );
    },);
  }
}