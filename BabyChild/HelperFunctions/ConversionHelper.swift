//
//  ConversionHelper.swift
//  BabyChild
//
//  Created by Mowsumi Rahman on 25/11/2019.
//  Copyright © 2019 Mowsumi Rahman. All rights reserved.
//

import Foundation
import SwiftUI

// Type converter
class TC{
    static func BooToStr(boo: Bool?) -> String{
        return (boo?.description ?? "nil")
    }
    
    // CoreData data to image and vv
    static func ImageToBinary(picture: UIImage, quality: CGFloat = 1) -> NSData{
        return picture.jpegData(compressionQuality: quality)! as NSData
    }
    
    static func DataToImage(data: Data) -> Image{
        return Image(uiImage: UIImage(data: data)!)
    }
}

