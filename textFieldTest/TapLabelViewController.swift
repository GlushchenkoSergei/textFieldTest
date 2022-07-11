//
//  TapLabelViewController.swift
//  textFieldTest
//
//  Created by mac on 11.07.2022.
//

import UIKit

class TapLabelViewController: UIViewController {

    @IBOutlet var selectedLabel: UILabel!
    @IBOutlet var lblTerms: UILabel!
    let text = "Тут будут слова по которым осуществляется клик."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedLabel.text = "Нажми на слово"
        setElement()
    }
    
    func setElement() {
    lblTerms.text = text
    self.lblTerms.textColor =  UIColor.white
    let underlineAttriString = NSMutableAttributedString(string: text)
    let range1 = (text as NSString).range(of: "которым")
         underlineAttriString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20), range: range1)
        underlineAttriString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range1)
    lblTerms.attributedText = underlineAttriString
    lblTerms.isUserInteractionEnabled = true
    lblTerms.addGestureRecognizer(UITapGestureRecognizer(target:self, action: #selector(tapLabel(gesture:))))
    }
    
    @IBAction func tapLabel(gesture: UITapGestureRecognizer) {
        
        let termsRange = (text as NSString).range(of: "Тут")
        let termsRange2 = (text as NSString).range(of: "будут")
        let termsRange3 = (text as NSString).range(of: "слова")
        let termsRange4 = (text as NSString).range(of: "по")
        let termsRange5 = (text as NSString).range(of: "которым")
        let termsRange6 = (text as NSString).range(of: "осуществляется")
        let termsRange7 = (text as NSString).range(of: "клик.")
        
        if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange) {
            selectedLabel.text = "Тут"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange2) {
            selectedLabel.text = "будут"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange3) {
            selectedLabel.text = "слова"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange4) {
            selectedLabel.text = "по"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange5) {
            selectedLabel.text = "которым"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange6) {
            selectedLabel.text = "осуществляется"
        } else if gesture.didTapAttributedTextInLabel(label: lblTerms, inRange: termsRange7) {
            selectedLabel.text = "клик"
        } else {
            selectedLabel.text = "none"
        }
   
    }
  
}

extension UITapGestureRecognizer {
    func didTapAttributedTextInLabel(label: UILabel, inRange targetRange: NSRange) -> Bool {
        // Create instances of NSLayoutManager, NSTextContainer and NSTextStorage
        let layoutManager = NSLayoutManager()
        let textContainer = NSTextContainer(size: CGSize.zero)
        let textStorage = NSTextStorage(attributedString: label.attributedText!)

        // Configure layoutManager and textStorage
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)

        // Configure textContainer
        textContainer.lineFragmentPadding = 0.0
        textContainer.lineBreakMode = label.lineBreakMode
        textContainer.maximumNumberOfLines = label.numberOfLines
        let labelSize = label.bounds.size
        textContainer.size = labelSize

        // Find the tapped character location and compare it to the specified range
        let locationOfTouchInLabel = self.location(in: label)
        let textBoundingBox = layoutManager.usedRect(for: textContainer)
        //let textContainerOffset = CGPointMake((labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x,
        //(labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y);
        let textContainerOffset = CGPoint(x: (labelSize.width - textBoundingBox.size.width) * 0.5 - textBoundingBox.origin.x, y: (labelSize.height - textBoundingBox.size.height) * 0.5 - textBoundingBox.origin.y)

        //let locationOfTouchInTextContainer = CGPointMake(locationOfTouchInLabel.x - textContainerOffset.x,
        // locationOfTouchInLabel.y - textContainerOffset.y);
        let locationOfTouchInTextContainer = CGPoint(x: locationOfTouchInLabel.x - textContainerOffset.x, y: locationOfTouchInLabel.y - textContainerOffset.y)
        let indexOfCharacter = layoutManager.characterIndex(for: locationOfTouchInTextContainer, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return NSLocationInRange(indexOfCharacter, targetRange)
    }
}
