//
//  Extension + UITextView.swift
//  textFieldTest
//
//  Created by mac on 10.07.2022.
//

import UIKit

extension  UITextView {
    
    func mutablePart(of textNSMutable: NSMutableAttributedString, element: String, attributes: [NSAttributedString.Key : Any]) -> NSMutableAttributedString {
        
//        let textTest = NSMutableAttributedString(attributedString: self.attributedText)
//        let stringTest = textTest.mutableString as String
        
        let string = textNSMutable.mutableString as String
        let attributedOriginalText = textNSMutable
        
        if string.contains(element) {
            //        if originalText.contains(element) {
            //        let attributedOriginalText = NSMutableAttributedString(string: originalText)
            
            let array = text.components(separatedBy: element)
            var count = 0
            
            for x in 0...array.count - 2 {
                count += array[x].count
                attributedOriginalText.addAttributes(attributes, range: NSRange(location: count, length: element.count))
                count += element.count
            }
//            self.attributedText = attributedOriginalText
        }
        return attributedOriginalText
    }
    
    func dynamicFont(string: String, from beginnerValue: CGFloat, step stepFont: CGFloat) {
        let attributedOriginalText = NSMutableAttributedString(string: string)
        
        var count = 0
        var font = beginnerValue
        let array = string.components(separatedBy: " ")
        
        for x in array {
            attributedOriginalText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: font), range: NSRange(location: count, length: x.count))
            font += stepFont
            count += (x.count + 1)
        }
        
        self.attributedText = attributedOriginalText
    }
     
}



