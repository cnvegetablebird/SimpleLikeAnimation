//
//  PDFloraButton.swift
//  PDFloraButton
//
//  Created by Priyam Dutta on 27/08/16.
//  Copyright © 2016 Priyam Dutta. All rights reserved.
//

import UIKit

enum ButtonPosition {
    case center
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case midTop
    case midBottom
    case midLeft
    case midRight
}

func getRadian(degree: CGFloat) -> CGFloat {
        return CGFloat(degree * CGFloat(M_PI)/180)
}

class PDFloraButton: UIButton {
    
      let radius: CGFloat = 20.0
      let childButtonSize: CGFloat = 10.0
      let circumference: CGFloat = 360.0
      let delayInterval = 0.0
      let duration = 0.25
      let damping: CGFloat = 0.9
      let initialVelocity: CGFloat = 0.9
      var anchorPoint: CGPoint!
    
      var xPadding: CGFloat = 10.0
      var yPadding: CGFloat = 10.0
      var buttonSize: CGFloat = 0.0
      var childButtons = 0
      var buttonPosition: ButtonPosition = .center
      var childButtonsArray = [UIButton]()
      var degree: CGFloat = 0.0
      var imageArray = [String]()
    
    convenience init(withPosition position: ButtonPosition, size: CGFloat, numberOfPetals: Int, images: [String]) {
       
        self.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        self.layer.cornerRadius = size/2.0
       
        childButtons = numberOfPetals
        buttonPosition = position
        imageArray = images
        
        let popTime = dispatch_time(DISPATCH_TIME_NOW,
                                    Int64(0.01 * Double(NSEC_PER_SEC)) / Int64(NSEC_PER_SEC))
        dispatch_after(popTime, dispatch_get_main_queue()) { () -> Void in
            self.center = CGPoint(x: (self.superview?.frame)!.midX - 10, y: (self.superview?.frame)!.midY - 10)
            self.anchorPoint = self.center
            self.createButtons(numberOfPetals)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Create Buttons
      func createButtons(numbers: Int) {
        for index in 0..<numbers {
            let petal = UIButton(frame: CGRect(x: 0, y: 0, width: childButtonSize, height: childButtonSize))
            petal.center = self.center
            petal.layer.cornerRadius = childButtonSize/2.0
            petal.backgroundColor = UIColor.redColor()
//            petal.setTitleColor(UIColor.black, forState: UIControlState())
            petal.tag = index
            if index < imageArray.count {
             petal.setImage(UIImage(named: imageArray[index]), forState: UIControlState())
            }
            self.superview?.addSubview(petal)
            self.superview?.bringSubviewToFront(self)
            childButtonsArray.append(petal)
        }
    }
    
    // Center
      func presentationForCenter() {
        for (index, item) in self.childButtonsArray.enumerate() {
            item.alpha = 1.0
            self.degree = getRadian((circumference/CGFloat(childButtons))*CGFloat(index))
            UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: initialVelocity, options: UIViewAnimationOptions(), animations: {
                item.center = CGPoint(x: self.anchorPoint.x+(self.radius*cos(self.degree)), y: self.anchorPoint.y+(self.radius*sin(self.degree)))
                }, completion: { (completion) in
                    UIView.animateWithDuration(1, animations: { 
                        item.transform = CGAffineTransformMakeScale(0.1, 0.1)
                        }, completion: { (finished) in
                            item.alpha = 0.0
                    })
            })
            
        }
    }
    
 
   
    
}
