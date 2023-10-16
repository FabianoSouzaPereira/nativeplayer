import 'package:flutter/material.dart';
import 'package:nativeplayer/core/player/VideoPlayerManager.dart';
import 'package:nativeplayer/models/camera.dart';
import 'package:nativeplayer/ui/Pages/home/VideoPlayerScreen.dart';
import 'package:nativeplayer/ui/Pages/home/widget/VideoPlayerWidget.dart';

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerManager _controller;
  late Camera currentCamera;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer(currentCamera.url);
  }

  void _initializeVideoPlayer(String videoUrl) {
    _controller = VideoPlayerManager();
    _controller.playVideo(videoUrl);
    _controller.initialize().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  void changeCamera(Camera newCamera) {
    currentCamera = newCamera;
    _controller.pauseVideo();
    _initializeVideoPlayer(currentCamera.url);
  }

  void startPlayer() {}

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: <Widget>[
          VideoPlayerWidget(camera: currentCamera),
          if (_controller.isBuffering())
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.nativePlayerDispose();
  }
}
