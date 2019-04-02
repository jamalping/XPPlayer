

import AVFoundation


/// 播放器管理类
public class XPPlayer {
   
    fileprivate var asset: AVURLAsset?
    fileprivate var playerItem: AVPlayerItem?
    fileprivate var avPlayer: AVPlayer?
    fileprivate var playerLayer: AVPlayerLayer?
    fileprivate var isBuffering: Bool?
    fileprivate var isReadyToPlay: Bool?
    
    var rate: Float = AVSpeechUtteranceDefaultSpeechRate
    var isPlaying: Bool = false
    var playState: XPPlayerPlaybackState = XPPlayerPlaybackState.unknown
    var loadState: XPPlayerLoadState = XPPlayerLoadState.unknown
    var assetURL: URL?
    var playView: XPPlayerView?
    var scalingMode: XPPlayerScalingMode = XPPlayerScalingMode.aspectFill
    
    fileprivate var isPreparedToPlay: Bool = false
    public init() { }
    
    func play() {
        if !isPreparedToPlay {
            preparedToPlay()
        }else {
            self.avPlayer?.play()
            self.avPlayer?.rate = self.rate
            self.isPlaying = true
            self.playState = .playing
        }
    }
    
    func preparedToPlay() {
        
        guard self.initializePlayer() else { return }
        isPreparedToPlay = true
        
        self.play()
        self.loadState = .prepare
//        if (_playerPrepareToPlay) _playerPrepareToPlay(self, self.assetURL);
    }
    
    func initializePlayer() -> Bool {
        guard let astURL = assetURL else {
            return false
        }
        
        asset = AVURLAsset.init(url: astURL)
        playerItem = AVPlayerItem.init(asset: asset!)
        avPlayer = AVPlayer.init(playerItem: playerItem!)

        self.audioTracks(isEnable: true, playerItem: playerItem!)

        let avPlayerLayer = AVPlayerLayer.init(player: self.avPlayer!)
        playView?.layer.addSublayer(avPlayerLayer)
        if #available(iOS 9.0, *) {
            playerItem?.canUseNetworkResourcesForLiveStreamingWhilePaused = false
        }
        if #available(iOS 10.0, *) {
            playerItem?.preferredForwardBufferDuration = 5
            avPlayer?.automaticallyWaitsToMinimizeStalling = false
        }

        self.itemObserving()
        return true
    }
    
    func audioTracks(isEnable: Bool, playerItem: AVPlayerItem) {
        playerItem.tracks.forEach { (track) in
            track.isEnabled = isEnable
        }
    }
    
    func itemObserving() {
        
    }
    
}

