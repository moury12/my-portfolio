import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/components/custom_button.dart';
import 'package:protfolio/core/components/custom_drawer_widget.dart';
import 'package:protfolio/core/components/custom_text.dart';
import 'package:protfolio/core/constant/custom_space.dart';
import 'package:protfolio/core/constant/fontsize_constant.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/constant/screen_helper.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';
import 'package:protfolio/core/utils/constant_variable.dart';
import 'package:protfolio/views/education_experience_part.dart';
import 'package:protfolio/views/widget/background_video_widget.dart';
import 'package:protfolio/views/widget/experience_education_timeline_item_widget.dart';
import 'package:protfolio/views/widget/social_media_icon_widget.dart';
import 'package:protfolio/views/widget/top_bar_widget.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:video_player/video_player.dart';

import 'widget/portfolioTitleWidget.dart';
import 'widget/profile_circle_image_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player controller with an asset or network video.
    _controller = VideoPlayerController.asset('assets/videos/galaxy.mp4')
      ..setLooping(
        true,
      )
      ..setPlaybackSpeed(.5) // Loop the video
      ..setVolume(0.0); // Mute the video if you don't want sound

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose(); // Dispose the controller when done
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: CustomDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          BackgroundVideoWidget(
              initializeVideoPlayerFuture: _initializeVideoPlayerFuture,
              controller: _controller),
          Column(
            children: [
              Padding(
                padding: padding12(context),
                child: TopBarWidget(scaffoldKey: _scaffoldKey),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: padding12(context),
                    child: Column(
                      spacing: 16.h,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // SizedBox(
                        //   height: MediaQuery.of(context).viewPadding.top,
                        // ),

                        ScreenHelper.isMobile(context) ||
                                ScreenHelper.isSmallTablet(context)
                            ? ProfileCircleImage()
                            : SizedBox.shrink(),
                        // ScreenHelper.isMobile(context) ? space20H : space50H,
                        FullHeightSizedBoxWidget(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            spacing: spaceing16(context),
                            children: [
                              ScreenHelper.isMobile(context)
                                  ? SizedBox.shrink()
                                  : ScreenHelper.isTablet(context)
                                      ? space20W
                                      : SizedBox(
                                          width: 50.w,
                                        ),

                              Expanded(
                                flex: 3,
                                child: Column(
                                  spacing: 12.h,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ///==============================name=========================///
                                    CustomText(
                                      text: 'Hi, It\'s Sadia Bennthe Azad',
                                      style: poppinsBold.copyWith(
                                          fontSize:
                                              responsiveFontSize24(context),
                                          color: AppColors.kTextColor),
                                    ),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomText(
                                          text: 'I\'m ',
                                          style: poppinsSemiBold.copyWith(
                                              fontSize:
                                                  responsiveFontSize16(context),
                                              color: AppColors.kTextColor),
                                        ),
                                        Expanded(
                                          ///==============================Designation=========================///

                                          child: DefaultTextStyle(
                                            style: poppinsSemiBold.copyWith(
                                                fontSize: responsiveFontSize16(
                                                    context),
                                                color: AppColors.kPrimaryColor),
                                            child: AnimatedTextKit(
                                              animatedTexts: [
                                                TyperAnimatedText(
                                                    'Mobile Application Developer'),
                                                TyperAnimatedText(
                                                    'Flutter Cross platform Developer'),
                                                // WavyAnimatedText('Mobile Application Developer'),
                                                // WavyAnimatedText('Flutter Cross platform Developer'),
                                              ],
                                              isRepeatingAnimation: true,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    ///==============================description=========================///

                                    CustomText(
                                      text:
                                          "I am a passionate mobile app developer specializing in Flutter, with expertise in GetX and Bloc for state management. I focus on building responsive, high-performance applicationsMy projects incorporate deep linking, animations, AI-driven features,Push notification, real time conversation with socket io, Web Rtc, and optimized user experiences. I am constantly exploring new technologies to push the boundaries of app development.",
                                      style: poppinsMedium.copyWith(
                                          fontSize:
                                              responsiveFontSize8(context)),
                                    ),

                                    ///========================social Media====================///

                                    Row(
                                      children: [
                                        ...List.generate(
                                          4,
                                          (index) {
                                            final social =
                                                socialMediaList[index];
                                            return SocialMediaIconWidget(
                                              icon: social['icon'],
                                            );
                                          },
                                        )
                                      ],
                                    ),

                                    Align(
                                      alignment: Alignment
                                          .centerLeft, // Aligns button to left, change as needed
                                      child: IntrinsicWidth(
                                        // Ensures button width adjusts to text
                                        child: CustomButton(
                                          onTap: () {},
                                          title: "Download CV",
                                          // shadowColor: AppColors.kPrimaryColor,
                                          // blurRadius: 20,
                                          // fillColor: Colors.black,
                                          // textColor: AppColors.kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              ///==========================Image=============================///
                              ScreenHelper.isMobile(context) ||
                                      ScreenHelper.isSmallTablet(context)
                                  ? SizedBox.shrink()
                                  : Expanded(
                                      flex: 2, child: ProfileCircleImage())
                            ],
                          ),
                        ),
                        space16H,

                        ///========================= Education============================///
                        EducationExperiencePart()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
