import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        let registrar = registrar(forPlugin: "VideoPlayerView")
        registrar.register(CustomVideoPlayerFactory(messenger: registrar.messenger()), withId: "video_player_view")


        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
