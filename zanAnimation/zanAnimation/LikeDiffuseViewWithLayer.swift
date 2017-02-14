//
//  LikeDiffuseViewWithLayer.swift
//  zanAnimation
//
//  Created by chennan on 17/2/9.
//  Copyright © 2017年 CN. All rights reserved.
//

import UIKit

class LikeDiffuseViewWithLayer: UIView {

    var layer1: CALayer!
    var layer2: CALayer!
    var layer3: CALayer!
    var layer4: CALayer!
    var layer5: CALayer!
    var layer6: CALayer!
    
    var clickBtn: UIButton!
    var likeImageView: UIImageView!
    var originalLikeImageView: UIImageView!
    var selectLikeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupCircleViewUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func clickBtnAction(btn: UIButton) {
        
        circleViewMove()
        // 
        originalLikeImageView.hidden = true
        likeImageView.hidden = false
        
        UIView.animateWithDuration(1, animations: {
            self.likeImageView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.likeImageView.transform = CGAffineTransformRotate(self.likeImageView.transform, -0.1)
            self.likeImageView.tintColor = UIColor.orangeColor() //UIColor(colorLiteralRed: 246, green: 96, blue: 97, alpha: 1.0) // UIColor.orangeColor()
        }) { (finished) in
            UIView.animateWithDuration(1, animations: {
                self.likeImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.likeImageView.transform = CGAffineTransformRotate(self.likeImageView.transform, 0.1)
                }, completion: { (finished) in
                    UIView.animateWithDuration(0.25, animations: {
                        self.likeImageView.transform = CGAffineTransformMakeRotation(0)
                        }, completion: { (finished) in
//                            self.likeImageView.tintColor = UIColor.whiteColor()
                            self.likeImageView.hidden = true
                            self.originalLikeImageView.hidden = true
                            self.selectLikeImageView.hidden = false
                    })
            })
        }
    }
    
    func circleViewMove() {
        
        viewHidden(false)
        
        let baseInt: CGFloat = 2
        let radius: CGFloat = 5 * baseInt    // 半径
        let verticalMoveDistance: CGFloat = 4 * baseInt  // 垂直移动距离
        let horizontalMoveDistance: CGFloat = 3 * baseInt // 横向移动距离
        
        let originalX = self.layer1.position.x
        let originalY = self.layer1.position.y
        
        let moveX1 = originalX + horizontalMoveDistance
        let moveY1 = originalY - verticalMoveDistance
        
        let moveX2 = originalX + radius
        let moveY2 = originalY
        
        let moveX3 = originalX + horizontalMoveDistance
        let moveY3 = originalY + verticalMoveDistance
        
        let moveX4 = originalX - horizontalMoveDistance
        let moveY4 = originalY + verticalMoveDistance
        
        let moveX5 = originalX - radius
        let moveY5 = originalY
        
        let moveX6 = originalX - horizontalMoveDistance
        let moveY6 = originalY - verticalMoveDistance
        
        let originalPoint: CGPoint = CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)
        
        let animationPoint = CAKeyframeAnimation(keyPath: "position")
        animationPoint.values = [ NSValue.init(CGPoint: originalPoint),
                              NSValue.init(CGPoint: CGPoint(x: moveX1, y: moveY1))
                            ]
        animationPoint.keyTimes = [0, 1]
        animationPoint.duration = 1.0
        animationPoint.fillMode = kCAFillModeForwards
        animationPoint.removedOnCompletion = false
        self.layer1.addAnimation(animationPoint, forKey: "position1")
        
        
        animationPoint.values = [ NSValue.init(CGPoint: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)),
                              NSValue.init(CGPoint: CGPoint(x: moveX2, y: moveY2))
        ]
        self.layer2.addAnimation(animationPoint, forKey: "position1")
        
        animationPoint.values = [ NSValue.init(CGPoint: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)),
                              NSValue.init(CGPoint: CGPoint(x: moveX3, y: moveY3))
        ]
        self.layer3.addAnimation(animationPoint, forKey: "position1")
        
        animationPoint.values = [ NSValue.init(CGPoint: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)),
                              NSValue.init(CGPoint: CGPoint(x: moveX4, y: moveY4))
        ]
        self.layer4.addAnimation(animationPoint, forKey: "position1")
        
        animationPoint.values = [ NSValue.init(CGPoint: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)),
                              NSValue.init(CGPoint: CGPoint(x: moveX5, y: moveY5))
        ]
        self.layer5.addAnimation(animationPoint, forKey: "position1")
        
        animationPoint.values = [ NSValue.init(CGPoint: CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)),
                              NSValue.init(CGPoint: CGPoint(x: moveX6, y: moveY6))
        ]
        self.layer6.addAnimation(animationPoint, forKey: "position1")
        
        
        let animationScale = CAKeyframeAnimation(keyPath: "transform.scale")
        animationScale.values = [ 1, 0.01]
        animationScale.keyTimes = [0, 1]
        animationScale.duration = 1.0
        animationScale.beginTime = CACurrentMediaTime() + animationPoint.duration
        animationScale.fillMode = kCAFillModeForwards
        animationScale.removedOnCompletion = false
        
        self.layer1.addAnimation(animationScale, forKey: "animationScale1")
        self.layer2.addAnimation(animationScale, forKey: "animationScale1")
        self.layer3.addAnimation(animationScale, forKey: "animationScale1")
        self.layer4.addAnimation(animationScale, forKey: "animationScale1")
        self.layer5.addAnimation(animationScale, forKey: "animationScale1")
        self.layer6.addAnimation(animationScale, forKey: "animationScale1")
    }
    
    func setupUI() {
        
        clickBtn = UIButton(type: .Custom)
        clickBtn.frame = self.bounds
        addSubview(clickBtn)
        clickBtn.backgroundColor = UIColor.clearColor()
        clickBtn.addTarget(self, action: #selector(LikeDiffuseView.clickBtnAction(_:)), forControlEvents: .TouchUpInside)
        
        let likeImg = UIImage(named: "未选中")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        likeImageView = UIImageView(image: likeImg)
        likeImageView.frame = CGRect(x: 0, y: 0, width: 14, height: 15)
        likeImageView.center = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        addSubview(likeImageView)
        likeImageView.tintColor = UIColor.whiteColor()
        likeImageView.tintColor = UIColor(colorLiteralRed: 246, green: 96, blue: 97, alpha: 1.0)
        likeImageView.hidden = true
        
        originalLikeImageView = UIImageView(image: UIImage(named: "未选中"))
        originalLikeImageView.frame = likeImageView.frame
        addSubview(originalLikeImageView)
        
        selectLikeImageView = UIImageView(image: UIImage(named: "选中"))
        selectLikeImageView.frame = likeImageView.frame
        addSubview(selectLikeImageView)
        selectLikeImageView.hidden = true
    }
    
    func setupCircleViewUI() {
        
        layer1 = CALayer.init()
        layer1.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y + 5, width: 5, height: 5)
        layer1.backgroundColor = UIColor.redColor().CGColor
        layer1.cornerRadius = layer1.bounds.size.height * 0.5
        
        layer2 = CALayer.init()
        layer2.frame = layer1.frame
        layer2.backgroundColor = UIColor.blueColor().CGColor
        layer2.cornerRadius = layer1.bounds.size.height * 0.5
        
        layer3 = CALayer.init()
        layer3.frame = layer1.frame
        layer3.backgroundColor = UIColor.blackColor().CGColor
        layer3.cornerRadius = layer1.bounds.size.height * 0.5
        
        layer4 = CALayer.init()
        layer4.frame = layer1.frame
        layer4.backgroundColor = UIColor.orangeColor().CGColor
        layer4.cornerRadius = layer1.bounds.size.height * 0.5
        
        layer5 = CALayer.init()
        layer5.frame = layer1.frame
        layer5.backgroundColor = UIColor.brownColor().CGColor
        layer5.cornerRadius = layer1.bounds.size.height * 0.5
        
        layer6 = CALayer.init()
        layer6.frame = layer1.frame
        layer6.backgroundColor = UIColor.greenColor().CGColor
        layer6.cornerRadius = layer1.bounds.size.height * 0.5
        
        self.layer.addSublayer(self.layer1)
        self.layer.addSublayer(self.layer2)
        self.layer.addSublayer(self.layer3)
        self.layer.addSublayer(self.layer4)
        self.layer.addSublayer(self.layer5)
        self.layer.addSublayer(self.layer6)
        viewHidden(true)
    }
    
    func viewHidden(flag: Bool) {
        layer1.hidden = flag
        layer2.hidden = flag
        layer3.hidden = flag
        layer4.hidden = flag
        layer5.hidden = flag
        layer6.hidden = flag
        layer6.hidden = flag
    }
}
