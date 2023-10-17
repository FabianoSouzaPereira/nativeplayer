import Foundation
import AVKit
import Flutter

class VideoPlayerManager {
    private let channelName: String
    private let methodChannel: FlutterMethodChannel

    init(channelName: String, binaryMessenger: FlutterBinaryMessenger) {
        self.channelName = channelName
        self.methodChannel = FlutterMethodChannel(name: channelName, binaryMessenger: binaryMessenger)
        setupMethodChannel()
    }

    private func setupMethodChannel() {
        methodChannel.setMethodCallHandler { [weak self] (call, result) in
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
            
            } else if call.method == "seekVideo" {
                if let argumentsJson = call.arguments as? String {
                    let argumentData = argumentsJson.data(using: .utf8)!
                    let decoder = JSONDecoder()
                    do {
                        if let time = try? decoder.decode(Double.self, from: argumentData){
                            NativeVideoPlayer.shared.seekVideo(to: time, completionHandler: ((Bool) -> Swift.Void)?.none)
                        }
                    }
                }
                
            } else if call.method == "isBuffering" {
                
                NativeVideoPlayer.shared.isBuffering()

            } else if call.method == "resiseAspectVideo" {
                if let argumentsJson = call.arguments as? String {
                    let argumentData = argumentsJson.data(using: .utf8)!
                    let decoder = JSONDecoder()
                    do {
                        if let aspectRatio = try? decoder.decode(String.self, from: argumentData){
                            NativeVideoPlayer.shared.reziseAspectVideo(aspectRatio: AVLayerVideoGravity(rawValue: aspectRatio) )
                        }
                    }
                }
                

            } else if call.method == "nativePlayerDispose" {

                NativeVideoPlayer.shared.nativePlayerDispose()

            } 
            

            // Envie uma resposta para o Flutter se necessário
            result(nil)
        }
    }
}
