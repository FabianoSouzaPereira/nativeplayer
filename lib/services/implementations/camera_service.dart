import 'package:nativeplayer/models/camera.dart';
import 'package:nativeplayer/repositories/abstractions/abstract_camera_repository.dart';
import 'package:nativeplayer/services/abstractions/abstract_camera_service.dart';

class CameraService extends AbstractCameraService {
  final AbstractCameraRepository cameraRepository;

  CameraService({required this.cameraRepository});

  @override
  Future<Camera?> getCameras() {
    // TODO: implement getCameras
    throw UnimplementedError();
  }
}
