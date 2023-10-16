import 'package:nativeplayer/models/camera.dart';

abstract class AbstractCameraService {
  Future<Camera?> getCameras();
}
