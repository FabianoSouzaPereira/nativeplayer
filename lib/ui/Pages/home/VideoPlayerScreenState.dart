import 'package:flutter/material.dart';
import 'package:nativeplayer/core/player/VideoPlayerManager.dart';
import 'package:nativeplayer/models/camera.dart';
import 'package:nativeplayer/ui/Pages/home/VideoPlayerScreen.dart';
import 'package:nativeplayer/ui/Pages/home/widget/VideoPlayerWidget.dart';

abstract class VideoPlayerScreenState {}

class VideoPlayerScreenInitial extends VideoPlayerScreenState {}

class VideoPlayerState extends State<VideoPlayerScreen> {
  List<Camera> cameras = [
    Camera(
      "https://www.tse.jus.br/videos/video-teste/@@streaming/file/campanha-esclarecimento-carro-2008.mp4",
      "camera 1",
      "intelbras",
      1900,
    ),
    Camera(
      "https://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4",
      "camera 2",
      "intelbras",
      1900,
    ),
  ];

  late VideoPlayerManager _controller;
  late Camera currentCamera;

  @override
  void initState() {
    super.initState();
    currentCamera = cameras.first;
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
          VideoPlayerWidget(cameras: cameras),
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
