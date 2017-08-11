//
//  ViewController.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 08/02/2017.
//	<alesvinciguerra@gmail.com>
//Copyright (C) 2017 Arc676/Alessandro Vinciguerra

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
