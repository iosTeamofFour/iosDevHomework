//
//  AppDelegate.swift
//  iosapp1
//
//  Created by Apple on 2019/9/10.
//  Copyright © 2019 Apple. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var start:Int=0
    var end:Int=0
    var time:Int=0
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("a")
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        print("b")
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print("c")
        end=YhyGetTimeCHUO()
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print("d")
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print("e")
        start=YhyGetTimeCHUO()
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print("f")
        time=end-start
        print("use time:")
        print(time)
        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

     func viewDidLoad() {
        // Do any additional setup after loading the view, typically from a nib.
        let date = Date()
        let timeFormatter = DateFormatter()
        //日期显示格式，可按自己需求显示
        timeFormatter.dateFormat = "yyy-MM-dd' at 'HH:mm:ss"
        let strNowTime = timeFormatter.string(from: date) as String
        print(strNowTime)
    }
    
   func YhyGetTimeCHUO() -> Int{
        
        //获取当前时间
        
        let now = NSDate()
        
        // 创建一个日期格式器
        
        let dformatter = DateFormatter()
        
        dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        
        print("当前日期时间：\(dformatter.string(from: now as Date))")
        
        //当前时间的时间戳
        
        let timeInterval:TimeInterval = now.timeIntervalSince1970
        
        let timeStamp = Int(timeInterval)
        
        return timeStamp
        
    }
}

