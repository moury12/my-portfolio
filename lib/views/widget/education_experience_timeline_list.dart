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
  List<TimelineEvent> items = [];
  int currentIndex =0;
  @override
  void initState() {
_addItemsOneByOne();
    super.initState();
  }
  void _addItemsOneByOne() async{
    for(var event in widget.timeLineList){
      await Future.delayed(Duration(milliseconds: 300));
      if(mounted){
        listKey.currentState?.insertItem(items.length,duration: Duration(milliseconds: 500));
        setState(() {
          items.add(event);
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedList(shrinkWrap: true,
      initialItemCount: items.length,
      itemBuilder: (context, index, animation) {
        bool isLeft = index.isEven;


        return TimelineTile(
          oppositeContents: isLeft
              ? ExperceniceEducationTimeLineItem(
            timelineModel:items[index],
            isLeft: isLeft, animation: animation,
          )
              : SizedBox.shrink(),
          contents: !isLeft
              ? ExperceniceEducationTimeLineItem(
            timelineModel:items[index], animation: animation,
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