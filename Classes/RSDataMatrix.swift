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


struct ZXMatrix
{
    let data = Int[]()
    let rows = 0
    let columns = 0
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        
        for(var i=0;i<self.rows*self.columns;i++)
        {
            data += 0
        }
    }
    
    func enumerate(enumeration:(row:Int,column:Int,value:Int)->Void)
    {
        for(var i=0;i<self.rows*self.columns;i++)
        {
            enumeration(row:i/self.columns,
                column:i%self.columns,
                value:self.data[i])
        }
    }
    
    subscript(row: Int,column:Int) -> Int {
        get {
            return data[row * columns + column]
        }
        set(newValue) {
            data[row * columns + column] = newValue
        }
    }
}


//var array = ZXMatrix(rows:5,columns:5)
//
//array[0,0] = 4
//
//array.enumerate({(row: Int, column: Int, value: Int) in
//    
//    println("\(String(row)) - \(String(column)) - \(String(value))")
//    
//    
//    })
//
//
//array[1,1] = 3
//array
//println(array[4,2])
//println(array.rows)
