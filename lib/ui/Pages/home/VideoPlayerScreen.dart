import 'package:flutter/material.dart';
import 'package:nativeplayer/models/camera.dart';
import 'package:nativeplayer/ui/Pages/home/VideoPlayerScreenState.dart';

class VideoPlayerScreen extends StatefulWidget {
  final List<Camera> cameras;

  const VideoPlayerScreen({Key? key, required this.cameras}) : super(key: key);

  void changeCamera(Camera newCamera) {
    VideoPlayerScreenState().changeCamera(newCamera);
  }

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}
