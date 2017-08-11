//
//  AppDelegate.swift
//  PlateCodes Mac
//
//  Created by Alessandro Vinciguerra on 07/02/2017.
//  Copyright © 2017 Arc676. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var view: MacViewController!
    @IBOutlet weak var aboutPanel: NSPanel!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        view.searchField.delegate = view
        view.goSearch()
    }

    @IBAction func showAbout(sender: NSMenuItem) {
        aboutPanel.setIsVisible(true)
    }

}
