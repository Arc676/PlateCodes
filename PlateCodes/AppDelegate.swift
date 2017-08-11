//
//  AppDelegate.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 1/15/16.
//  Copyright © 2016 Arc676. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var currentSearchSpace = 0

    func setSearchSpace(_ shortcutItem: UIApplicationShortcutItem) {
        if shortcutItem.localizedTitle == "Beijing Embassies" {
            currentSearchSpace = 0
        } else if shortcutItem.localizedTitle == "Chinese Provinces" {
            currentSearchSpace = 1
        } else {
            currentSearchSpace = 2
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        if let shortcutItem = launchOptions?[UIApplicationLaunchOptionsKey.shortcutItem] {
            setSearchSpace(shortcutItem as! UIApplicationShortcutItem)
            return false
        }
        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        setSearchSpace(shortcutItem)
    }

}
