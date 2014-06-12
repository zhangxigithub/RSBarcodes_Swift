//
//  RSDataMatrix.swift
//  RSBarcodesSample
//
//  Created by zhangxi on 14-6-12.
//  Copyright (c) 2014年 P.D.Q. All rights reserved.
//

import UIKit

class RSDataMatrix: RSAbstractCodeGenerator,RSCodeGenerator {



       // Barcode initiator, subclass should return its own value.
    override func initiator() -> String {
        return ""
    }
    
    // Barcode terminator, subclass should return its own value.
    override func terminator() -> String {
        return ""
    }
    
    // Barcode content, subclass should return its own value.
    override func barcode(contents:String) -> String {
        return ""
    }
}
