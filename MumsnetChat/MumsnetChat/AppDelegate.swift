//
//  AppDelegate.swift
//  MumsnetChat
//
//  Created by Tim Windsor Brown on 29/03/2016.
//  Copyright © 2016 MumsnetChat. All rights reserved.
//

import UIKit
import ChattoAdditions
import Chatto
import FirebaseAnalytics
import FirebaseInstanceID
import FirebaseMessaging


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        // SETUP API
        AppDelegate.setUpAPIConstants()
        
        self.setupPushNotification(application)
        
        
        
        return true
    }
    
    /*
     Sets some constants required for keychain and API access
     */
    class func setUpAPIConstants() {
        MumsnetAPIAccessToken.ClientID = "e2c2cbcfb116aef33d4bfad38a6ac73e8bd1c064305264d8cbbf133ebfa0f21e"
        MumsnetAPIAccessToken.ClientSecret = "4896b155dc3915d5b156cbbd10faff25affeaa4a6cb1f68bc03de25c14060bc8"
        
        
//        // TEST TOKEN
//        UserManager.setCurrentToken("958bb0a3973efa60b3041962faaaabc899b0896dcd02eb3e4545948a021dcf7d")
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    // Push Notifications
    
    func setupPushNotification(application:UIApplication) {
        
        // Register for remote notifications
        let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(forTypes: [.Alert, .Badge, .Sound], categories: nil)
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
        FIRApp.configure()
    }
    
    func application(
        application: UIApplication,
                     didReceiveRemoteNotification userInfo: [NSObject : AnyObject],
                     fetchCompletionHandler completionHandler: (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // Print message ID.
        print("Message ID: \(userInfo["gcm.message_id"]!)")
        
        // Print full message.
        print("%@", userInfo)
    }

    
}


