//
//  RSUnifiedCodeGenerator.swift
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 6/10/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class RSUnifiedCodeGenerator: RSCodeGenerator {
    var useBuiltInCode128Generator = true
    class var shared: RSUnifiedCodeGenerator {
    return UnifiedCodeGeneratorSharedInstance
    }
    
    // RSCodeGenerator
    
    func generateCode(contents: String, machineReadableCodeObjectType: String) -> UIImage? {
        var codeGenerator:RSCodeGenerator? = nil
        switch machineReadableCodeObjectType {
        case AVMetadataObjectTypeQRCode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeAztecCode:
            return RSAbstractCodeGenerator.generateCode(contents, filterName: RSAbstractCodeGenerator.filterName(machineReadableCodeObjectType))
            
        case AVMetadataObjectTypeCode39Code:
            codeGenerator = RSCode39Generator()
        case AVMetadataObjectTypeCode39Mod43Code:
            codeGenerator = RSCode39Mod43Generator()
        case AVMetadataObjectTypeEAN8Code:
            codeGenerator = RSEAN8Generator()
        case AVMetadataObjectTypeEAN13Code:
            codeGenerator = RSEAN13Generator()
        case AVMetadataObjectTypeITF14Code:
            codeGenerator = RSITF14Generator()
        case AVMetadataObjectTypeUPCECode:
            codeGenerator = RSUPCEGenerator()
        case AVMetadataObjectTypeCode93Code:
            codeGenerator = RSCode93Generator()
        case AVMetadataObjectTypeDataMatrixCode:
            codeGenerator = RSDataMatrix()
        // iOS 8 included, but my implementation's performance is better :)
        case AVMetadataObjectTypeCode128Code:
            if self.useBuiltInCode128Generator {
                return RSAbstractCodeGenerator.generateCode(contents, filterName: RSAbstractCodeGenerator.filterName(machineReadableCodeObjectType))
            } else {
                codeGenerator = RSCode128Generator()
            }
            
        case RSBarcodesTypeISBN13Code:
            codeGenerator = RSISBN13Generator()
        case RSBarcodesTypeISSN13Code:
            codeGenerator = RSISSN13Generator()
        case RSBarcodesTypeExtendedCode39Code:
            codeGenerator = RSExtendedCode39Generator()

            
        default:
            return nil
        }
        return codeGenerator!.generateCode(contents, machineReadableCodeObjectType: machineReadableCodeObjectType)
    }
    
    func generateCode(machineReadableCodeObject: AVMetadataMachineReadableCodeObject) -> UIImage? {
        return self.generateCode(machineReadableCodeObject.stringValue, machineReadableCodeObjectType: machineReadableCodeObject.type)
    }
}

let UnifiedCodeGeneratorSharedInstance = RSUnifiedCodeGenerator()
