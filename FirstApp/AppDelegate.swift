//
//  AppDelegate.swift
//  FirstApp
//
//  Created by Evgeniy Zatsepin on 03.12.2017.
//  Copyright © 2017 Evgeniy Zatsepin. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSUserNotificationCenterDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSUserNotificationCenter.default.delegate = self//add this in the applicationDidFinishLaunching call
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func userNotificationCenter(_ center: NSUserNotificationCenter, shouldPresent notification: NSUserNotification) -> Bool {
        return true
    }
    

}


