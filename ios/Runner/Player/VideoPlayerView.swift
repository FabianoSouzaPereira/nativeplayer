import Flutter
import AVKit

class VideoPlayerView: NSObject, FlutterPlatformView {
    private let viewController: AVPlayerViewController

    init(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?, binaryMessenger messenger: FlutterBinaryMessenger) {
        viewController = AVPlayerViewController()
        super.init()
        let channel = FlutterMethodChannel(name: "video_player_view_\(viewId)", binaryMessenger: messenger)
        
        // Configurar o player de vídeo no 'viewController' aqui, com o URL do vídeo e outras configurações

        channel.setMethodCallHandler { (call, result) in
            guard let self = self else { return }

            if call.method == "playVideo" {
                if let cameraJson = call.arguments as? String {
                    let cameraData = cameraJson.data(using: .utf8)!
                    let decoder = JSONDecoder()

                    do {
                        if let camera = try? decoder.decode(Camera.self, from: cameraData){
                            if let videoURL = URL(string: camera.url) {
                                NativeVideoPlayer.shared.playVideo(videoUrl: camera.url)
                            }
                        } else{
                            print("Erro na desserialização")
                        }
                    }
                }
            } else if call.method == "pauseVideo" {

                NativeVideoPlayer.shared.pauseVideo()

            } else if call.method == "stopVideo" {

                NativeVideoPlayer.shared.stopVideo()
            
            } else if call.method == "isBuffering" {
                
                NativeVideoPlayer.shared.isBuffering()

            } else if call.method == "reziseAspectVideo" {
                
                NativeVideoPlayer.shared.reziseAspect(aspectRatio: aspectRatio)

            } else if call.method == "nativePlayerDispose" {

                NativeVideoPlayer.shared.nativePlayerDispose()

            }
            

            // Envie uma resposta para o Flutter se necessário
            result(nil)
        }
    }

    func view() -> UIView {
        return viewController.view
    }
}
