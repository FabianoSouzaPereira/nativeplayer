import AVKit

// A classe NativeVideoPlayer é projetada como um singleton usando a abordagem shared. 
// Ela lida com a reprodução de vídeo usando o framework AVKit do iOS.

class NativeVideoPlayer {
    static let shared = NativeVideoPlayer()
    static var Buffering = false;

    private var playerViewController: AVPlayerViewController?
    private var player: AVPlayer?

    private init() {
        // Inicialize a instância do player se necessário
    }

    func playVideo(videoUrl: String) {
        if let url = URL(string: videoUrl) {
            let player = AVPlayer(url: url)
            playerViewController = AVPlayerViewController()
            playerViewController?.player = player
            if let playerViewController = playerViewController {
                UIApplication.shared.keyWindow?.rootViewController?.present(playerViewController, animated: true, completion: {
                    player.play()
                })
            }
        }
    }

    func pauseVideo() {
        playerViewController?.player?.pause()
    }
    
    //The video stops instantly and the playback position resets to the beginning.
    func stopVideo() {
        playerViewController?.player?.setRate(0.0, time: .zero, atHostTime: .zero)
    }

    func seekVideo(to time: TimeInterval, completionHandler: ((Bool) -> Swift.Void)? = nil) {
        // todo implementation
    }

    func isBuffering(){
        let playerItem = playerViewController?.player?.currentItem
        playerItem!.addObserver(self as! NSObject, forKeyPath: "playbackBufferEmpty", options: .new, context: nil)
        playerItem!.addObserver(self as! NSObject, forKeyPath: "playbackLikelyToKeepUp", options: .new, context: nil)
        playerItem!.addObserver(self as! NSObject, forKeyPath: "playbackBufferFull", options: .new, context: nil)
    }
    
    public func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutableRawPointer) {
        if object is AVPlayerItem {
            switch keyPath {
                case "playbackBufferEmpty": 
                    NativeVideoPlayer.Buffering = true
                    // Show loader
                    break
                case "playbackLikelyToKeepUp": 
                    NativeVideoPlayer.Buffering = false
                    // Hide loader
                    break
                case "playbackBufferFull": 
                    NativeVideoPlayer.Buffering = false
                    // Hide loader
                    break
                case .none:
                    break
                case .some(_):
                    break
            }
        }
    }
    
    func reziseAspectVideo(aspectRatio: AVLayerVideoGravity){
        playerViewController?.videoGravity = aspectRatio
    }

    func nativePlayerDispose(){
        playerViewController?.player?.pause()
        playerViewController?.player = nil
    }
}
