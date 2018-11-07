import UIKit

class ViewController: UIViewController {

//    @IBAction func buttonTapped(_ sender: UIButton) {
//    @IBAction func switchToggled(_ sender: UISwitch) {
//    @IBAction func buttonTapped(_ sender: UISwitch) {
    @IBAction func buttonTapped(_ sender: UIButton) {
//        print("Called buttonTapped(_:)")
//        print("sender: \(sender)")
//        print("Is control on? \(sender.isOn)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        for _ in 0...10 {
//        for _ in 0...10 {
            array.removeObject(at: 0)
        }
    }
}
