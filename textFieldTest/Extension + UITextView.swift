//
//  Extension + UITextView.swift
//  textFieldTest
//
//  Created by mac on 10.07.2022.
//

import UIKit

extension  UITextView {
    
    func mutablePart(element: String, attributes: [NSAttributedString.Key : Any])  {
        
        let attributesTextView = NSMutableAttributedString(attributedString: self.attributedText)
        let stringTextView = attributesTextView.mutableString as String
        
        if stringTextView.contains(element) {
            let array = text.components(separatedBy: element)
            var count = 0
            
            for x in 0...array.count - 2 {
                count += array[x].count
                attributesTextView.addAttributes(attributes, range: NSRange(location: count, length: element.count))
                count += element.count
            }
        }
        self.attributedText = attributesTextView
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



