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

        
        let flutterEngine = FlutterEngine(name: "my_engine")

        flutterEngine.run(withEntrypoint: nil)

        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

        GeneratedPluginRegistrant.register(with: flutterViewController)

        // Instância de VideoPlayerManager com o FlutterBinaryMessenger do FlutterViewController
        let videoPlayerManager = VideoPlayerManager(channelName: "player", binaryMessenger: flutterViewController as! FlutterBinaryMessenger)

        // Janela do aplicativo
        window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = flutterViewController
        window.makeKeyAndVisible()

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
