//
//  ConversionHelper.swift
//  BabyChild
//
//  Created by Mow on 25/11/2019.
//  Copyright © 2019 Mow. All rights reserved.
//

import Foundation
import SwiftUI


class TC{
    static func BooToStr(boo: Bool?) -> String{
        return (boo?.description ?? "nil")
    }
    
    static func ImageToBinary(picture: UIImage, quality: CGFloat = 1) -> NSData{
        return picture.jpegData(compressionQuality: quality)! as NSData
    }
    
    static func DataToImage(data: Data) -> Image{
        return Image(uiImage: UIImage(data: data)!)
    }
}

