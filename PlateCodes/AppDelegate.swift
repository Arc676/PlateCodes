//
//  AppDelegate.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 1/15/16.
//	<alesvinciguerra@gmail.com>
//Copyright (C) 2016-7 Arc676/Alessandro Vinciguerra

//This program is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation (version 3)

//This program is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.

//You should have received a copy of the GNU General Public License
//along with this program.  If not, see <http://www.gnu.org/licenses/>.
//See README and LICENSE for more details

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
