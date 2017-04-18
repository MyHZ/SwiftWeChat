//
//  ConversionViewController.swift
//  SwiftWeChat
//
//  Created by DM on 2017/4/11.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

class ConversionViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let currentUserInfo = RCIMClient.shared().currentUserInfo!
        
//        self.targetId = "huangzhen2"
    
        self.conversationType = .ConversationType_PRIVATE
//        title = currentUserInfo.name
        // Do any additional setup after loading the view.
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
