//
//  ViewController.swift
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

class ViewController: UIViewController {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchResults: UITextView!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var searchSpaceLabel: UILabel!
    @IBOutlet weak var ignoreCase: UISwitch!

    let delegate = UIApplication.shared.delegate as! AppDelegate

    let searchSpaces = [
        "Embassy codes in Beijing",
        "Provinces in China",
        "Provinces in Italy",
        "Embassy codes in Germany",
        "German Kfz-Zulassungsbehörden",
        "Swiss cantons",
        "French departments"
    ]

    override func viewDidLoad() {
		self.searchSpaceLabel.text = "Searching: " + self.searchSpaces[self.delegate.currentSearchSpace]
    }

	func setSearchSpace(_ space: Int) {
		delegate.currentSearchSpace = space
		searchSpaceLabel.text = "Searching: " + self.searchSpaces[space]
	}

    @IBAction func goSearch(_ sender: AnyObject) {
		searchResults.text = SearchController.search(
			searchRegex: searchField.text!,
			ignoreCase: ignoreCase.isOn,
			searchSpace: self.delegate.currentSearchSpace)
		searchResults.font = UIFont(name: "Helvetica", size: 13)
    }

    @IBAction func doneEditing(_ sender: AnyObject) {
        searchField.resignFirstResponder()
    }

    @IBAction func changeSearchSpace(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select a search space", message: "", preferredStyle: .actionSheet)
		for i in 0..<searchSpaces.count {
			actionSheet.addAction(UIAlertAction(title: searchSpaces[i], style: .default, handler: { _ in
				self.setSearchSpace(i)
			}))
		}
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: { _ in
            self.searchResults.text = ""
			self.searchField.text = ""
        })
        goSearch(NSNull())
    }

    @IBAction func changeCaseIgnore(_ sender: AnyObject) {
        goSearch(NSNull())
    }
}
