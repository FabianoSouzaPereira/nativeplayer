import 'package:flutter/material.dart';
import 'package:nativeplayer/models/camera.dart';
import 'package:nativeplayer/ui/Pages/home/VideoPlayerScreen.dart';
import 'package:nativeplayer/ui/Pages/home/widget/ListCameras.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
        appBar: AppBar(
          title: const Text('Player de Vídeo Flutter'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: VideoPlayerScreen(
                cameras: cameras,
              ),
            ),
            Expanded(
              flex: 3,
              child: ListCameras(
                cameras: cameras,
              ),
            ),
          ],
        ));
  }
}
