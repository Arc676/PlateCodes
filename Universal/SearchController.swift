//
//  SearchController.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 07/02/2017.
//  Copyright © 2017 Arc676. All rights reserved.
//

import Foundation

class SearchController: AnyObject {

    class func search(searchRegex: String, ignoreCase: Bool, searchSpace: Int) -> String{
        var query = searchRegex
        var results = ""
        if query.characters.count == 0 {
            return SearchableData.searchItems[searchSpace].joined(separator: "\n")
        }
        if ignoreCase {
            query = "(?i)" + query
        }
        for code in SearchableData.searchItems[searchSpace] {
            if code.range(of: query, options: .regularExpression) != nil {
                results += code + "\n"
            }
        }
        return results
    }
    
}
