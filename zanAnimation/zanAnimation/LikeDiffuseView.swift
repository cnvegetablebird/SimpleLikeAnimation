//
//  LikeDiffuseView.swift
//  zanAnimation
//
//  Created by chennan on 17/2/9.
//  Copyright © 2017年 CN. All rights reserved.
//

import UIKit

class LikeDiffuseView: UIView {

    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    var view4: UIView!
    var view5: UIView!
    var view6: UIView!
    
    var clickBtn: UIButton!
    var likeImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupCircleViewUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func clickBtnAction(btn: UIButton) {
        
//        setImage()

        circleViewMove()
        UIView.animateWithDuration(1, animations: {
            self.likeImageView.transform = CGAffineTransformMakeScale(1.2, 1.2)
            self.likeImageView.transform = CGAffineTransformRotate(self.likeImageView.transform, -0.1)
            self.likeImageView.tintColor = UIColor.orangeColor()
        }) { (finished) in
            UIView.animateWithDuration(1, animations: {
                self.likeImageView.transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.likeImageView.transform = CGAffineTransformRotate(self.likeImageView.transform, 0.1)
                }, completion: { (finished) in
                    UIView.animateWithDuration(0.25, animations: {
                        self.likeImageView.transform = CGAffineTransformMakeRotation(0)
                        }, completion: { (finished) in
                            self.likeImageView.tintColor = UIColor.whiteColor()
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
        
        let originalX = self.view1.center.x
        let originalY = self.view1.center.y
        
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
        
        print(self.view1)
        UIView.animateWithDuration(1, animations: {
            
            self.view1.center = CGPoint(x: moveX1, y: moveY1)
            self.view2.center = CGPoint(x: moveX2, y: moveY2)
            self.view3.center = CGPoint(x: moveX3, y: moveY3)
            self.view4.center = CGPoint(x: moveX4, y: moveY4)
            self.view5.center = CGPoint(x: moveX5, y: moveY5)
            self.view6.center = CGPoint(x: moveX6, y: moveY6)
        }) { (finished) in
            
            UIView.animateWithDuration(1, animations: {
                self.view1.transform = CGAffineTransformMakeScale(0.01, 0.01)
                self.view2.transform = CGAffineTransformMakeScale(0.01, 0.01)
                self.view3.transform = CGAffineTransformMakeScale(0.01, 0.01)
                self.view4.transform = CGAffineTransformMakeScale(0.01, 0.01)
                self.view5.transform = CGAffineTransformMakeScale(0.01, 0.01)
                self.view6.transform = CGAffineTransformMakeScale(0.01, 0.01)
                }, completion: { (finished) in
                    self.viewHidden(true)
                    self.resetStatus()
            })
        }
    }
    
    func setupUI() {
        
        clickBtn = UIButton(type: .Custom)
        clickBtn.frame = self.bounds
        addSubview(clickBtn)
        clickBtn.backgroundColor = UIColor.clearColor()
        clickBtn.addTarget(self, action: #selector(LikeDiffuseView.clickBtnAction(_:)), forControlEvents: .TouchUpInside)
        
        let likeImg = UIImage(named: "赞－灰")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        likeImageView = UIImageView(image: likeImg)
        likeImageView.frame = CGRect(x: 0, y: 0, width: 14, height: 15)
        likeImageView.center = CGPoint(x: self.frame.size.width * 0.5, y: self.frame.size.height * 0.5)
        addSubview(likeImageView)
        likeImageView.tintColor = UIColor.whiteColor()
        likeImageView.tintColor = UIColor.orangeColor()
    }
    
    
    func setImage() {
        let likeImg = UIImage(named: "赞－点击后")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        likeImageView = UIImageView(image: likeImg)
        likeImageView.tintColor = UIColor.orangeColor()
    }
    
    func setupCircleViewUI() {
        
        view1 = UIView()
        view1.frame = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y + 5, width: 5, height: 5)
        view1.backgroundColor = UIColor.redColor()
        view1.layer.cornerRadius = view1.bounds.size.height * 0.5
        view1.clipsToBounds = true
        
        view2 = UIView()
        view2.frame = view1.frame
        view2.backgroundColor = UIColor.blueColor()
        view2.layer.cornerRadius = view1.bounds.size.height * 0.5
        view2.clipsToBounds = true
        
        view3 = UIView()
        view3.frame = view1.frame
        view3.backgroundColor = UIColor.blackColor()
        view3.layer.cornerRadius = view1.bounds.size.height * 0.5
        view3.clipsToBounds = true
        
        view4 = UIView()
        view4.frame = view1.frame
        view4.backgroundColor = UIColor.orangeColor()
        view4.layer.cornerRadius = view1.bounds.size.height * 0.5
        view4.clipsToBounds = true
        
        view5 = UIView()
        view5.frame = view1.frame
        view5.backgroundColor = UIColor.brownColor()
        view5.layer.cornerRadius = view1.bounds.size.height * 0.5
        view5.clipsToBounds = true
        
        view6 = UIView()
        view6.frame = view1.frame
        view6.backgroundColor = UIColor.greenColor()
        view6.layer.cornerRadius = view1.bounds.size.height * 0.5
        view6.clipsToBounds = true
        
        viewHidden(true)
        
        self.addSubview(self.view1)
        self.addSubview(self.view2)
        self.addSubview(self.view3)
        self.addSubview(self.view4)
        self.addSubview(self.view5)
        self.addSubview(self.view6)
    }
    
    func viewHidden(flag: Bool) {
        view1.hidden = flag
        view2.hidden = flag
        view3.hidden = flag
        view4.hidden = flag
        view5.hidden = flag
        view6.hidden = flag
    }
    
    func resetStatus() {
        self.view1.transform = CGAffineTransformIdentity
        self.view2.transform = CGAffineTransformIdentity
        self.view3.transform = CGAffineTransformIdentity
        self.view4.transform = CGAffineTransformIdentity
        self.view5.transform = CGAffineTransformIdentity
        self.view6.transform = CGAffineTransformIdentity
        
        self.view1.center = CGPoint(x: self.bounds.origin.x, y: self.bounds.origin.y + 5)
        self.view2.center = self.view1.center
        self.view3.center = self.view1.center
        self.view4.center = self.view1.center
        self.view5.center = self.view1.center
        self.view6.center = self.view1.center
    }
}
