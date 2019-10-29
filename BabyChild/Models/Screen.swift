//
//  Screen.swift
//  BabyChild
//
//  Created by Mow on 28/10/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import UIKit

struct Screen {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    static var statusBarHeight: CGFloat {
        return UIStatusBarManager.accessibilityFrame().height
    }
    static var statusBarWidth: CGFloat {
        return UIStatusBarManager.accessibilityFrame().width
    }
}
