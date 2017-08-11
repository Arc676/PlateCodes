//
//  RTL-Segue.swift
//  PlateCodes
//
//  Created by Alessandro Vinciguerra on 1/17/16.
//  Copyright © 2016 Arc676. All rights reserved.
//

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
