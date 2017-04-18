//
//  LoginViewController.swift
//  SwiftWeChat
//
//  Created by DM on 2017/4/12.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit
import JSAnimatedImagesView

extension UIView{
//    @IBInspectable var cornerRadius:CGFloat{
//        get{
//            return layer.cornerRadius
//        }
//        set{
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
}

class LoginViewController: UIViewController,RCAnimatedImagesViewDelegate {

    @IBOutlet var imageView: RCAnimatedImagesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.delegate = self
        self.imageView.startAnimating()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func animatedImagesNumber(ofImages animatedImagesView: RCAnimatedImagesView!) -> UInt {
        return 3
    }
    
    func animatedImagesView(_ animatedImagesView: RCAnimatedImagesView!, imageAt index: UInt) -> UIImage! {
        return UIImage(named: "headImage")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
