//
//  SearchController.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 07/02/2017.
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

import Foundation

class SearchController: AnyObject {

    class func search(searchRegex: String, ignoreCase: Bool, searchSpace: Int) -> String {
        var query = searchRegex
        var results = ""
        if query.characters.count == 0 {
            return SearchableData.searchItems(searchSpace).joined(separator: "\n")
        }
        if ignoreCase {
            query = "(?i)" + query
        }
        for code in SearchableData.searchItems(searchSpace) {
            if code.range(of: query, options: .regularExpression) != nil {
                results += code + "\n"
            }
        }
        return results
    }
    
}
