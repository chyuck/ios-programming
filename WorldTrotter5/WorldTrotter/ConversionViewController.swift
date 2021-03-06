import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celciusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelciusLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let date = Date()
        let calendar = Calendar.current
        let hours = calendar.component(.hour, from: date)
        
        if 6 < hours && hours < 18 {
            view.backgroundColor = UIColor.lightGray
        } else {
            view.backgroundColor = UIColor.darkGray
        }
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celciusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelciusLabel() {
        if let celciusValue = celciusValue {
            celciusLabel.text = numberFormatter.string(from: NSNumber(value: celciusValue.value))
        } else {
            celciusLabel.text = "???"
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        let replacementTextHasAlphabeticCharacter = string.rangeOfCharacter(from: NSCharacterSet.letters)
        
        if (existingTextHasDecimalSeparator != nil && replacementTextHasDecimalSeparator != nil) || replacementTextHasAlphabeticCharacter != nil {
            return false
        } else {
            return true
        }
    }
}
