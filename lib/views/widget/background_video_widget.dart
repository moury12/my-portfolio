import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';class BackgroundVideoWidget extends StatelessWidget {
  const BackgroundVideoWidget({
    super.key,
    required Future<void> initializeVideoPlayerFuture,
    required VideoPlayerController controller,
  }) : _initializeVideoPlayerFuture = initializeVideoPlayerFuture, _controller = controller;

  final Future<void> _initializeVideoPlayerFuture;
  final VideoPlayerController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
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
    );
  }
}
