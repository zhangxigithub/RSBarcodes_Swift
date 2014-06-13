//
//  ViewController.swift
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 6/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: RSCodeReaderViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        var array = ZXArray(rows:5,columns:5)
        
        array[4,2] = 4;
        println(array[4,2])
        
        
        
        
        
    }
}

