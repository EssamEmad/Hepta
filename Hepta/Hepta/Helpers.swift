//
//  Helpers.swift
//  Hepta
//
//  Created by Essam on 5/2/16.
//  Copyright © 2016 Hepta Productions. All rights reserved.
//

import Foundation
import UIKit

class Helpers{
    
    static func greatestNumberSmallerThanOne(tuple:(x:CGFloat, y:CGFloat)) -> CGPoint{
        let angle = atan(abs(tuple.1 / tuple.0))
        return CGPoint(x: cos(angle),y: sin(angle))
    }
}