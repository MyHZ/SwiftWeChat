//
//  AppDelegate.swift
//  SwiftWeChat
//
//  Created by DM on 2017/4/11.
//  Copyright © 2017年 HZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,RCIMUserInfoDataSource {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //初始化APPKey
        
        RCIM.shared().userInfoDataSource = self
        
        
        return true
    }
    
    func connectServer(completion:@escaping ()->Void) {
        
        RCIM.shared().initWithAppKey("25wehl3u27grw")
        RCIM.shared().globalMessageAvatarStyle = .USER_AVATAR_CYCLE
        RCIM.shared().connect(withToken: "vnPwHueke/gGibj7Yu1NkSHVC5QLJ1SQMKv7VQxeWE0gc9Zy379lGxxvRptQ7pPHA/DReKV2beFPNGV/jINw1OxGwhef9Q9Q", success: { (userId) in
            print("链接成功1 \(userId ?? "")")
        
            let currentUser = RCUserInfo(userId: userId, name: "huangzhen", portrait: nil)
            RCIMClient.shared().currentUserInfo = currentUser
            
            DispatchQueue.main.async {
                completion()
            }
            
        }, error: { (_) in
            print("链接失败")
        }, tokenIncorrect: {
            print("Token不正确")
        })
        
    }
    
    func getUserInfo(withUserId userId: String!, completion: ((RCUserInfo?) -> Void)!) {
        
        let userInfo = RCUserInfo()
        userInfo.userId = userId
        switch userId {
        case "huangzhen":
            userInfo.name = "huangzhen"
            userInfo.portraitUri = "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2075750630,4216747848&fm=117&gp=0.jpg"
        
        case "huangzhen2":
            userInfo.name = "huangzhen2"
            userInfo.portraitUri = "https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2338643698,4051309964&fm=117&gp=0.jpg"
        default:
            userInfo.name = ""
        }
        
        return completion(userInfo)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
}

