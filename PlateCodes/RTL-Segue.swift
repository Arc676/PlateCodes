//
//  RTL-Segue.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 1/17/16.
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
import QuartzCore

class RTLSegue: UIStoryboardSegue {

    var direction = kCATransitionFromRight

    override init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        if source.title == "help" {
            direction = kCATransitionFromLeft
        }
    }

    //http://stackoverflow.com/a/31411862/2773311 by Michael-R
    override func perform() {
        let src: UIViewController = self.source 
        let dst: UIViewController = self.destination
        let transition: CATransition = CATransition()
        let timeFunc : CAMediaTimingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.duration = 0.25
        transition.timingFunction = timeFunc
        transition.type = kCATransitionPush
        transition.subtype = direction
        src.view.layer.add(transition, forKey: kCATransition)
        src.present(dst, animated: true, completion: nil)
    }
}
