//
//  ConversionListViewController.swift
//  SwiftWeChat
//
//  Created by DM on 2017/4/11.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit
import PopMenu

class ConversionListViewController: RCConversationListViewController {
    
    let conversion = RCConversationViewController()
    
    @IBAction func showMenu(_ sender: UIBarButtonItem) {
        
        let items = [
            MenuItem(title: "客服", iconName: "answer", glow:.red, index: 0),
            MenuItem(title: "聊天", iconName: "answer", glow:.blue,index: 1),
            MenuItem(title: "通讯录", iconName: "answer", glow:.green, index: 2),
            MenuItem(title: "关于", iconName: "answer", glow:.gray, index: 3)
        ]
        
        let menu = PopMenu(frame: self.view.bounds, items: items as Any as! [Any] )
        
        menu?.menuAnimationType = .sina
        if (menu?.isShowed)! {
            return
        }
    
        menu?.didSelectedItemCompletion = { (selectItem:MenuItem!) -> Void in
            
            switch selectItem.index {
            case 1:
                self.ClickMenu2()
            default:
                print(selectItem.index)
            }
        }
        
        menu?.show(at: self.view)
    }
    
    func ClickMenu1() {
        print("点击了 第一项")
    }
    func ClickMenu2() {
        
        let conversion = RCConversationViewController()
        conversion.targetId = "huangzhen2"
        conversion.conversationType = RCConversationType.ConversationType_PRIVATE
        conversion.title = "huangzhen2"
        navigationController?.pushViewController(conversion, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.connectServer {
            
            self.setDisplayConversationTypes([
                RCConversationType.ConversationType_PRIVATE.rawValue,
                RCConversationType.ConversationType_GROUP.rawValue,
                RCConversationType.ConversationType_CHATROOM.rawValue,
                RCConversationType.ConversationType_SYSTEM.rawValue,
                RCConversationType.ConversationType_APPSERVICE.rawValue])
            self.refreshConversationTableViewIfNeeded()
            
        }
        
    }
    
    override func onSelectedTableRow(_ conversationModelType: RCConversationModelType, conversationModel model: RCConversationModel!, at indexPath: IndexPath!) {
        
        //        let conversion = RCConversationViewController()
        //        conversion.targetId = model.targetId
        //        conversion.conversationType = RCConversationType.ConversationType_PRIVATE
        //        conversion.title = model.conversationTitle
        //        navigationController?.pushViewController(conversion, animated: true)
        //
        //        self.tabBarController?.tabBar.isHidden = true
        
        self.performSegue(withIdentifier: "tapOnCell", sender: self)
        
        conversion.targetId = model.targetId
        conversion.conversationType = RCConversationType.ConversationType_PRIVATE
        conversion.title = model.conversationTitle
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destVc = segue.destination as? RCConversationViewController
        destVc?.targetId = self.conversion.targetId
        destVc?.conversationType = self.conversion.conversationType
        destVc?.title = conversion.title
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
}
