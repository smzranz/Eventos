//
//  ColorFile.swift
//  ExamApp
//
//  Created by Shamshir Anees on 15/06/17.
//  Copyright © 2017 Citrus. All rights reserved.
//

import UIKit

class ColorFile: NSObject {

    func getPrimaryColor() -> UIColor{
        return  UIColor(red:39/255, green:86/255, blue:182/255, alpha:1.0)
    }
    func getMarkerBlueColor() -> UIColor{
        return  UIColor(red:59/255, green:123/255, blue:254/255, alpha:1.0)
    }
    func getMarkerRedColor() -> UIColor{
        return  UIColor(red:216/255, green:46/255, blue:51/255, alpha:1.0)
    }
    
}
