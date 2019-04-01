//
//  XPPlayerView.swift
//  Pods-XPPlayer_Example
//
//  Created by jamalping on 2019/4/1.
//

import UIKit


// MARK: 播放器View
public class XPPlayerView: UIView {
    
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        if self.isUserInteractionEnabled == false || self.isHidden == true || self.alpha <= 0.01 {
            return nil
        }
        if !self.point(inside: point, with: event) {
            return nil
        }
        
        /// 寻找合适的子视图响应事件
        
        let fitViews = self.subviews.filter { (childView) -> Bool in
            let childPoint = self.convert(point, to: childView)
            if let _ = childView.hitTest(childPoint, with: event) {
                return true
            }
            return false
        }
        if let fitView = fitViews.last {
            return fitView
        }
        
        return self
    }
    
    /*
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
     */
}
