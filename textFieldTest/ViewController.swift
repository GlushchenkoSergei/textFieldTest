//
//  ViewController.swift
//  textFieldTest
//
//  Created by mac on 10.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    @IBOutlet var textView2: UITextView!
    
    @IBOutlet var buttonYellow: UIButton!
    @IBOutlet var buttonGreen: UIButton!
    @IBOutlet var buttonRed: UIButton!
    
    var selectedColor = UIColor.red
    
    let text = """
The first four methods also return by reference the effective range and the longest effective range of the attributes. These ranges allow you to determine the extent of attributes. Conceptually, each character in an attributed string has its own collection of attributes; however, it’s often useful to know when the attributes and values are the same over a series of characters. This allows a routine to progress through an attributed string in chunks larger than a single character. In retrieving the effective range, an attributed string simply looks up information in its attribute mapping, essentially the dictionary of attributes that apply at the index requested. In retrieving the longest effective range, the attributed string continues checking characters past this basic range as long as the attribute values are the same. This extra comparison increases the execution time for these methods but guarantees a precise maximal range for the attributes requested.
"""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = text
        textView2.dynamicFont(from: 2, step: 1)

        buttonYellow.alpha = 0.2
        buttonGreen.alpha = 0.2
        buttonRed.alpha = 1
    }

    @IBAction func button(_ sender: Any) {
        guard let textFromTextField = textField.text else { return }
        
        let attributes = [NSAttributedString.Key.backgroundColor: selectedColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        
        textView.mutablePart(element: textFromTextField, attributes: attributes)
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            buttonYellow.alpha = 1
            buttonRed.alpha = 0.2
            buttonGreen.alpha = 0.2
            selectedColor = UIColor.yellow
        case 2:
            buttonYellow.alpha = 0.2
            buttonGreen.alpha = 1
            buttonRed.alpha = 0.2
            selectedColor = UIColor.green
        default:
            buttonYellow.alpha = 0.2
            buttonGreen.alpha = 0.2
            buttonRed.alpha = 1
            selectedColor = UIColor.red
        }
    }
    
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        let text = (textView.text! as NSString).substring(with: textView.selectedRange)
        textField.text = text
    }
    
}
    


