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
    
    
    let text = """
Разнообразный и богатый опыт начало повседневной работы по формированию позиции требует от нас системного анализа позиций, занимаемых участниками в отношении поставленных задач. Таким образом, новая модель организационной деятельности позволяет оценить значение существующих финансовых и административных условий. Равным образом выбранный нами инновационный путь в значительной степени обуславливает создание модели развития.
Задача организации, в особенности же курс на социально-ориентированный национальный проект позволяет оценить значение системы обучения кадров, соответствующей насущным потребностям. Задача организации, в особенности же реализация намеченного плана развития способствует повышению актуальности соответствующих условий активизации. Не следует, однако, забывать о том, что рамки и место обучения кадров требует определения и уточнения системы масштабного изменения ряда параметров? Задача организации, в особенности же постоянное информационно-техническое обеспечение нашей деятельности представляет собой интересный эксперимент проверки соответствующих условий активизации.
Дорогие друзья, сложившаяся структура организации способствует подготовке и реализации форм воздействия. Повседневная практика показывает, что сложившаяся структура организации играет важную роль в формировании существующих финансовых и административных условий. Повседневная практика показывает, что сложившаяся структура организации играет важную роль в формировании модели развития. Соображения высшего порядка, а также рамки и место обучения кадров создаёт предпосылки качественно новых шагов для системы масштабного изменения ряда параметров.
"""
    let testFont = """
The first four methods also return by reference the effective range and the longest effective range of the attributes. These ranges allow you to determine the extent of attributes. Conceptually, each character in an attributed string has its own collection of attributes; however, it’s often useful to know when the attributes and values are the same over a series of characters. This allows a routine to progress through an attributed string in chunks larger than a single character. In retrieving the effective range, an attributed string simply looks up information in its attribute mapping, essentially the dictionary of attributes that apply at the index requested. In retrieving the longest effective range, the attributed string continues checking characters past this basic range as long as the attribute values are the same. This extra comparison increases the execution time for these methods but guarantees a precise maximal range for the attributes requested.
"""
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = testFont
        textField.delegate = self
        textView.delegate = self
        textView.dataDetectorTypes = UIDataDetectorTypes.all
        
        textView2.dynamicFont(string: testFont, from: 2, step: 1)

        
    }

  
    @IBAction func button(_ sender: Any) {
        guard let textFromTextField = textField.text else { return }
        
        var text = NSMutableAttributedString(string: testFont)
        
        let dictionary2 = [NSAttributedString.Key.backgroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        let dictionary3 = [NSAttributedString.Key.backgroundColor: UIColor.green, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15)]
        
        text = textView.mutablePart(of: text, element: textFromTextField, attributes: dictionary2)
        text = textView.mutablePart(of: text, element: "The", attributes: dictionary3)
        textView.attributedText = text
    }
    
    
    @IBAction func button2(_ sender: Any) {
        var text = NSMutableAttributedString(attributedString: textView.attributedText)
        let dictionary3 = [NSAttributedString.Key.backgroundColor: UIColor.yellow, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        text = textView.mutablePart(of: text, element: "of", attributes: dictionary3)
        textView.attributedText = text

        
    }
    

}
extension ViewController: UITextFieldDelegate {
    
}
extension ViewController: UITextViewDelegate {
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        print(textView.selectedRange)
        let text = (textView.text! as NSString).substring(with: textView.selectedRange)
        print(text)
    }
    
}
    

