//
//  XPPlayerable.swift
//  Pods-XPPlayer_Example
//
//  Created by jamalping on 2019/4/1.
//

import Foundation

// MARK: 可播放协议，实现即可拥有播放功能
public protocol XPPlayerable {
    
    /// 播放器的view
    var playerView: UIView? { get set }
    
    /// 播放器所需要的资源
    var assetURL: URL? { get set }
}

private var playerKey: Void
extension XPPlayerable {
    /// 播放器对象
    var player: XPPlayer? {
        get {
            return objc_getAssociatedObject(self, &playerKey) as? XPPlayer
        }
        set {
            objc_setAssociatedObject(self, &playerKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 创建一个播放器
    mutating func createPlayer() {
        if self.player == nil {
            self.player = XPPlayer()
        }
    }
}

// MARK: Action
public extension XPPlayerable {
    func play() {
        
    }
    
    func stop() {
        
    }
    
}

// MARK: Enum

/// 播放器播放状态
///
/// - unknown: 未知
/// - playing: 正在播放
/// - paused: 暂停
/// - failed: 错误
/// - stop: 暂停
public enum XPPlayerPlaybackState {
    case unknown, playing, paused, failed, stop
}
/// 填充方式
///
/// - aspectFit: 等比例填充，直到一个维度到达区域边界
/// - aspectFill: 等比例填充，直到填充满整个视图区域，其中一个维度的部分区域会被裁剪
/// - Fill: 全部填充
public enum XPPlayerScalingMode {
    case aspectFit, aspectFill, Fill
}


// MARK: get set
private var currentTimeKey: Void?
private var totalTimeKey: Void?
private var bufferTimeKey: Void?
private var playStateKey: Void?
private var seekTimeKey: Void?
private var mutedKey: Void?
private var volumeKey: Void?
private var presentationSizeKey: Void?
private var rateKey: Void?
private var isPlayingKey: Void?
private var scalingModeKey: Void?


extension XPPlayerable {
    /// 当前播放的时间点
    var currentTime: TimeInterval? {
        get {
            return objc_getAssociatedObject(self, &currentTimeKey) as? TimeInterval
        }
        set {
            objc_setAssociatedObject(self, &currentTimeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 总时间
    var totalTime: TimeInterval? {
        get {
            return objc_getAssociatedObject(self, &totalTimeKey) as? TimeInterval
        }
        set {
            objc_setAssociatedObject(self, &totalTimeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    ///
    var bufferTime: TimeInterval? {
        get {
            return objc_getAssociatedObject(self, &bufferTimeKey) as? TimeInterval
        }
        set {
            objc_setAssociatedObject(self, &bufferTimeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 播放状态
    var playState: XPPlayerPlaybackState? {
        get {
            return objc_getAssociatedObject(self, &playStateKey) as? XPPlayerPlaybackState ?? .unknown
        }
        set {
            objc_setAssociatedObject(self, &playStateKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 播放的时间点
    var seekTime: TimeInterval? {
        get {
            return objc_getAssociatedObject(self, &seekTimeKey) as? TimeInterval
        }
        set {
            objc_setAssociatedObject(self, &seekTimeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 是否静音
    var muted: Bool? {
        get {
            return objc_getAssociatedObject(self, &mutedKey) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &mutedKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 音量
    var volume: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &volumeKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &volumeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 播放器的size
    var presentationSize: CGSize? {
        get {
            return objc_getAssociatedObject(self, &presentationSizeKey) as? CGSize
        }
        set {
            objc_setAssociatedObject(self, &presentationSizeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 音量
    var rate: CGFloat? {
        get {
            return objc_getAssociatedObject(self, &rateKey) as? CGFloat
        }
        set {
            objc_setAssociatedObject(self, &rateKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    /// 是否静音
    var isPlaying: Bool? {
        get {
            return objc_getAssociatedObject(self, &isPlayingKey) as? Bool
        }
        set {
            objc_setAssociatedObject(self, &isPlayingKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 填充方式
    var scalingMode: XPPlayerScalingMode? {
        get {
            return objc_getAssociatedObject(self, &scalingModeKey) as? XPPlayerScalingMode ?? .aspectFit
        }
        set {
            objc_setAssociatedObject(self, &scalingModeKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
