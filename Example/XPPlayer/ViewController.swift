//
//  ViewController.swift
//  XPPlayer
//
//  Created by jamalping on 04/01/2019.
//  Copyright (c) 2019 jamalping. All rights reserved.
//

import UIKit
import XPPlayer

class ViewController: UIViewController, XPPlayerable {
    var player: XPPlayer? = XPPlayer()
    
    var playerView: UIView?
    
    var assetURL: URL?
    
    let playerV = XPPlayerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let path = Bundle.main.path(forResource: "tttt.mp4", ofType: nil), let url = URL.init(string: path) {
            self.assetURL = url
        }
        playerV.frame = self.view.bounds
        self.view.addSubview(playerV)
        self.playerView = playerV
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.play()
    }

}

