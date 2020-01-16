//
//  Screen.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 28/10/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import UIKit

// Getting screen dimensions
struct Screen {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    static var size: CGRect {
        return UIScreen.main.bounds
    }
    // Spacer for list in home
    static var homeList: CGFloat {
        switch UIDevice.current.orientation{
        case .portrait, .portraitUpsideDown, .unknown:
                if height - 600 > 0{
                    return (height - 650)/2
                }
            default:
            return 0
        }
        return 0
    }
}
