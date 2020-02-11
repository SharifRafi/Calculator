import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var operators: [UIButton]!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var textFieldForCalculation: UITextField!
    @IBOutlet weak var container: UIView!
        
    var firstNumber = 0
    var number = ""
    var showInContainer = ""
    var demoNumber = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.layer.cornerRadius = 15
        //textFieldForCalculation.layer.cornerRadius = 10
        for button in buttons{
            button.layer.cornerRadius = 25
        }
        for operate in operators{
            operate.layer.cornerRadius = 25
        }
    }
    
    func operandCheck()  {
        if (demoNumber == 0){
            firstNumber = Int(number) ?? 0
        }
        if (demoNumber == 1){
            firstNumber +=  Int(number) ?? 0
        }
        if (demoNumber == 2){
            firstNumber -=  Int(number) ?? 0
        }
        if (demoNumber == 3){
            firstNumber *=  Int(number) ?? 0
        }
        if (demoNumber == 4){
            firstNumber /=  Int(number) ?? 0
        }
        
        number = ""
    }
    
    @IBAction func one(_ sender: UIButton) {
        
        if (sender.tag < 10){
            number = number + "\(sender.tag)"
            showInContainer = showInContainer + "\(sender.tag)"
        }

        if (sender.tag == 15){
            showInContainer = showInContainer + "+"
            operandCheck()
            demoNumber = 1
        }
        
        if (sender.tag == 16){
            showInContainer = showInContainer + "-"
             operandCheck()
             demoNumber = 2
        }
        
        if (sender.tag == 17){
            showInContainer = showInContainer + "*"
             operandCheck()
             demoNumber = 3
        }
        
        if (sender.tag == 18){
            showInContainer = showInContainer + "/"
             operandCheck()
             demoNumber = 4
        }
        
        if (sender.tag == 19){
            showInContainer = ""
            demoNumber = 0
            firstNumber = 0
            number = ""
            answerText.text = "\(firstNumber)"
        }
        
        if (sender.tag == 20){
            number.removeLast()
            print(number)
        }
        
        if (sender.tag == 22){
            operandCheck()
            answerText.text = "\(firstNumber)"
            print(firstNumber)
        }
        
        textFieldForCalculation.text = showInContainer
    }
}

