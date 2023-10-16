import 'package:flutter/services.dart';

class VideoPlayerManager {
  final MethodChannel _methodChannel = const MethodChannel("player");

  initialize() {}

  void playVideo(String videoUrl) {
    _methodChannel.invokeMethod("playVideo", {"videoUrl": videoUrl});
  }

  void pauseVideo() {
    _methodChannel.invokeMethod("pauseVideo");
  }

  void stopVideo() {
    _methodChannel.invokeMethod("stopVideo");
  }

  void seekVideo() {
    _methodChannel.invokeMethod("seekVideo");
  }

  isBuffering() {
    _methodChannel.invokeListMethod("isBuffering");
  }

  void reziseAspect(String aspectRatio) {
    _methodChannel.invokeMethod("resizeVideo", {"aspectRatio": aspectRatio});
  }

  void nativePlayerDispose() {
    _methodChannel.invokeListMethod("nativePlayerDispose");
  }
}
