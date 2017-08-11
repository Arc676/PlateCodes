//
//  ViewController.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 08/02/2017.
//  Copyright © 2017 Arc676. All rights reserved.
//

import Cocoa

class MacViewController: NSView, NSTextFieldDelegate {

    @IBOutlet weak var searchField: NSTextField!
    @IBOutlet weak var searchResults: NSTextView!

    var ignoreCase: Bool = true
    var searchSpace: Int = 0

    func goSearch() {
        searchResults.string = SearchController.search(
            searchRegex: searchField.stringValue,
            ignoreCase: ignoreCase,
            searchSpace: searchSpace)
        searchResults.font = NSFont(name: "Helvetica", size: 13)
    }

    @IBAction func changeSearchSpace(sender: NSPopUpButton) {
        searchSpace = sender.indexOfSelectedItem
        goSearch()
    }

    @IBAction func changeCaseIgnore(sender: NSButton) {
        ignoreCase = sender.state == NSOnState
        goSearch()
    }

    override func controlTextDidChange(_ obj: Notification) {
        goSearch()
    }

}
