//
//  ViewController.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 1/15/16.
//  Copyright © 2016 Arc676. All rights reserved.
//

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
        "Provinces in Italy"
    ]

    override func viewDidLoad() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIApplicationDidBecomeActive, object: nil, queue: nil, using: { _ in
            self.searchSpaceLabel.text = "Searching: " + self.searchSpaces[self.delegate.currentSearchSpace]
        })
    }

    @IBAction func goSearch(_ sender: AnyObject) {
        var results = ""
        var query = searchField.text!
        if query.characters.count == 0 {
            searchResults.text = ""
            return
        }
        if ignoreCase.isOn {
            query = "(?i)" + query
        }
        for code in SearchableData.searchItems[delegate.currentSearchSpace] {
            if code.range(of: query, options: .regularExpression) != nil {
                results += code + "\n"
            }
        }
        searchResults.text = results
    }

    @IBAction func doneEditing(_ sender: AnyObject) {
        searchField.resignFirstResponder()
    }

    @IBAction func changeSearchSpace(_ sender: AnyObject) {
        let actionSheet = UIAlertController(title: "Select a search space", message: "", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: searchSpaces[0], style: .default, handler: { _ in
            self.delegate.currentSearchSpace = 0
            self.searchSpaceLabel.text = "Searching: " + self.searchSpaces[0]
        }))
        actionSheet.addAction(UIAlertAction(title: searchSpaces[1], style: .default, handler: { _ in
            self.delegate.currentSearchSpace = 1
            self.searchSpaceLabel.text = "Searching: " + self.searchSpaces[1]
        }))
        actionSheet.addAction(UIAlertAction(title: searchSpaces[2], style: .default, handler: { _ in
            self.delegate.currentSearchSpace = 2
            self.searchSpaceLabel.text = "Searching: " + self.searchSpaces[2]
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true, completion: { _ in
            self.searchResults.text = ""
        })
        goSearch(NSNull())
    }

    @IBAction func changeCaseIgnore(_ sender: AnyObject) {
        goSearch(NSNull())
    }
}
