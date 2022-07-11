//
//  Extension + UILabel.swift
//  English Book
//
//  Created by mac on 11.07.2022.
//

import UIKit

class ExtensionUILabelVC: UIViewController {

    let textLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let textLabel2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    let mergeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        setPointLabel()
    }
    
    private func setPointLabel() {
        textLabel.text = "Первый лэйбл"
        textLabel.center.x = view.center.x
        textLabel.center.y = view.center.y
        textLabel.addAttributesText(color: .blue)
        
        textLabel2.center.x = view.center.x
        textLabel2.center.y = view.center.y + 50
        textLabel2.text = "Второй лэйбл"
        textLabel2.addAttributesText(color: .yellow)
        
        mergeLabel.center.x = view.center.x
        mergeLabel.center.y = view.center.y + 100
        mergeLabel.text = "Мердж"
        mergeLabel.attributedText = textLabel.attributedText
        mergeLabel.mergeTexts(with: textLabel2)
        
        view.addSubview(textLabel)
        view.addSubview(textLabel2)
        view.addSubview(mergeLabel)
    }
    
}
extension UILabel {
    
    func mergeTexts(with label: UILabel) {
        let attributedString = NSMutableAttributedString(attributedString: self.attributedText!)
        let attributedSecondLabel = label.attributedText!
        attributedString.append(attributedSecondLabel)
        self.attributedText = attributedString
    }
    
    func addAttributesText(color: UIColor) {
        let attributesTextView = NSMutableAttributedString(attributedString: self.attributedText ?? NSAttributedString(string: ""))
        let stringTextView = attributesTextView.mutableString as String
        
        attributesTextView.addAttribute(.backgroundColor, value: color, range: NSRange(location: 0, length: stringTextView.count))
        self.attributedText = attributesTextView
    }
}

