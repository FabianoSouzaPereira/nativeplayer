import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:nativeplayer/core/player/VideoPlayerManager.dart';
import 'package:nativeplayer/models/camera.dart';

class VideoPlayerWidget extends StatelessWidget {
  final Camera camera;
  const VideoPlayerWidget({Key? key, required this.camera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: 'video_player_view',
      surfaceFactory: (BuildContext context, PlatformViewController controller) {
        if (Platform.isIOS) {
          return UiKitView(
            viewType: 'video_player_view',
            onPlatformViewCreated: (id) {
              // Configurar visualização no iOS
              final uiKitViewController = controller as UiKitViewController;

              // Iniciar a reprodução de vídeo
            },
          );
        } else if (Platform.isAndroid) {
          return AndroidView(
            viewType: 'video_player_view',
            onPlatformViewCreated: (id) {
              // Configurar visualização no Android
              final androidViewController = controller as AndroidViewController;

              // Exemplo: Definir a URL do vídeo
            },
          );
        } else {
          // Lógica para outras plataformas
          return Container();
        }
      },
      onCreatePlatformView: (PlatformViewCreationParams params) {
        final videoPlayerManager = VideoPlayerManager();

        videoPlayerManager.initialize();

        videoPlayerManager.playVideo(camera.url);

        videoPlayerManager.reziseAspect("16 / 9");

        videoPlayerManager.nativePlayerDispose();

        videoPlayerManager.isBuffering();
      },
    );
  }
}
