//
//  Screen.swift
//  BabyChild
//
//  Created by Mow on 28/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import UIKit

//let screen = Screen()

struct Screen {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
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
