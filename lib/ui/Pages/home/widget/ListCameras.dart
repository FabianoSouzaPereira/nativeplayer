import 'package:flutter/material.dart';
import 'package:nativeplayer/models/camera.dart';

class ListCameras extends StatelessWidget {
  final List<Camera> cameras;

  const ListCameras({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: cameras.map((camera) {
        return ListTile(
          title: Text(camera.name),
          onTap: () {
            // Faça algo quando o usuário tocar na câmera
          },
        );
      }).toList(),
    );
  }
}
