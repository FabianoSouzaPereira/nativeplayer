import 'package:flutter/material.dart';
import 'package:nativeplayer/core/player/VideoPlayerManager.dart';
import 'package:nativeplayer/ui/Pages/home/home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final VideoPlayerManager videoPlayerManager = VideoPlayerManager();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Player de Vídeo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(title: 'Player de Vídeo Home Page'),
    );
  }
}
