//
//  ViewController.swift
//  zanAnimation
//
//  Created by chennan on 17/2/8.
//  Copyright © 2017年 CN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var likeDiffuseView: LikeDiffuseView!
    var LikeDiffuseLayer: LikeDiffuseViewWithLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let frame = CGRect(x: 200, y: 300, width: 20, height: 20)
//        likeDiffuseView = LikeDiffuseView(frame: frame)
//        self.view.addSubview(likeDiffuseView)
        
        let frame = CGRect(x: 170, y: 300, width: 20, height: 20)
        LikeDiffuseLayer = LikeDiffuseViewWithLayer(frame: frame)
        self.view.addSubview(LikeDiffuseLayer)
    }
    
}

