import 'package:flutter/material.dart';
import 'package:protfolio/core/app_color.dart';
import 'package:protfolio/core/components/custom_text.dart';
import 'package:protfolio/core/constant/padding_constant.dart';
import 'package:protfolio/core/constant/screen_helper.dart';
import 'package:protfolio/core/constant/text_style_constant.dart';
import 'package:video_player/video_player.dart';

class VideoBackgroundPage extends StatefulWidget {
  const VideoBackgroundPage({super.key});

  @override
  _VideoBackgroundPageState createState() => _VideoBackgroundPageState();
}

class _VideoBackgroundPageState extends State<VideoBackgroundPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer:Drawer(
        child: Column(
          spacing: 16,
          children: [ CustomText(
              text: 'About', style: poppinsSemiBold, fontSize: 16),
            CustomText(
                text: 'Skill', style: poppinsSemiBold, fontSize: 16),
            CustomText(
                text: 'Contact', style: poppinsSemiBold, fontSize: 16),],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // Once the video is initialized, play it
                _controller.play();
                return FittedBox(
                  fit: BoxFit.cover, // Scale the video to cover the screen
                  child: SizedBox(
                    width: _controller.value.size.width,
                    height: _controller.value.size.height,
                    child: VideoPlayer(_controller),
                  ),
                );
              } else {
                // Show a loading spinner while the video is initializing
                return SizedBox.shrink();
              }
            },
          ),
          Padding(
            padding:ScreenHelper.isMobile(context)? padding12:padding24,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).viewPadding.top,
                ),
                Row(
                  spacing: 16,
                  children: [
                   Expanded(
                     child: Row(spacing: 6,
                       children: [
                       Text('Sadia',style: TextStyle(
                         fontSize: 26,
                         fontFamily: 'ProtestRiot',
                         fontWeight: FontWeight.w400,
                         color: AppColors.kTextColor,
                       ),),
                       Text('Bennthe',style: TextStyle(
                           fontSize: 26,
                           fontFamily: 'ProtestRiot',
                           fontWeight: FontWeight.w400,
                           color: AppColors.kPrimaryColor,
                           shadows: [Shadow(color: AppColors.kPrimaryColor,blurRadius:9)]),),
                     ],),
                   ),
                    // Spacer(),
                   ScreenHelper.isMobile(context)?
                       Builder(
                         builder: (context) {
                           return IconButton(onPressed: () {
                             Scaffold.of(context).openDrawer();
                           }, icon: Icon(Icons.menu,color: AppColors.kTextColor,size: 20,));
                         }
                       ): Row(
                      spacing: 12,children: [
                      CustomText(
                          text: 'About', style: poppinsSemiBold, fontSize: 16),
                      CustomText(
                          text: 'Skill', style: poppinsSemiBold, fontSize: 16),
                      CustomText(
                          text: 'Contact', style: poppinsSemiBold, fontSize: 16),
                    ],)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
