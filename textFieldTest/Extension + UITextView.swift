//
//  Extension + UITextView.swift
//  textFieldTest
//
//  Created by mac on 10.07.2022.
//

import UIKit

extension  UITextView {
    
    func mutablePart(element: String, attributes: [NSAttributedString.Key : Any]) {
        let attributedOriginalText = NSMutableAttributedString(attributedString: self.attributedText)
        let string = attributedOriginalText.mutableString as String
        
        if string.contains(element) {
            let array = text.components(separatedBy: element)
            var count = 0
            
            for x in 0...array.count - 2 {
                count += array[x].count
                attributedOriginalText.addAttributes(attributes, range: NSRange(location: count, length: element.count))
                count += element.count
            }
        }
        self.attributedText = attributedOriginalText
    }
    
    func dynamicFont(from beginnerValue: CGFloat, step stepFont: CGFloat) {
        let attributedOriginalText = NSMutableAttributedString(string: self.text)
        
        var count = 0
        var font = beginnerValue
        let array = self.text.components(separatedBy: " ")
        
        for x in array {
            attributedOriginalText.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: font), range: NSRange(location: count, length: x.count))
            font += stepFont
            count += (x.count + 1)
        }
        
        self.attributedText = attributedOriginalText
    }
     
}



