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
        return  UIColor(red:77/255, green:171/255, blue:248/255, alpha:1.0)
    }
    func getMarkerRedColor() -> UIColor{
        return  UIColor(red:216/255, green:46/255, blue:51/255, alpha:1.0)
    }
    
}
