//
//  RoundImageView.swift
//  SwiftWeChat
//
//  Created by DM on 2017/4/12.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

@IBDesignable
class RoundImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth:CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor:UIColor?{
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }

}
