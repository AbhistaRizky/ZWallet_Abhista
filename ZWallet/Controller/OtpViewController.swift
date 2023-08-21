//
//  OtpViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 14/08/23.
//

import UIKit

class OtpViewController: UIViewController {
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    @IBOutlet weak var TextField3: UITextField!
    @IBOutlet weak var TextField4: UITextField!
    @IBOutlet weak var TextField5: UITextField!
    @IBOutlet weak var TextField6: UITextField!
    @IBOutlet weak var ConfirmButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setup()
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    func setup() {
        TextField1.delegate = self
        TextField2.delegate = self
        TextField3.delegate = self
        TextField4.delegate = self
        TextField5.delegate = self
        TextField6.delegate = self
    }
}

extension OtpViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if text.count == 1 {
            switch textField {
            case TextField1:
                TextField1.text = text
                TextField2.becomeFirstResponder()
            case TextField2:
                TextField2.text = text
                TextField3.becomeFirstResponder()
            case TextField3:
                TextField3.text = text
                TextField4.becomeFirstResponder()
            case TextField4:
                TextField4.text = text
                TextField5.becomeFirstResponder()
            case TextField5:
                TextField5.text = text
                TextField6.becomeFirstResponder()
            case TextField6:
                TextField6.text = text
                TextField6.resignFirstResponder()
            default:
                break
            }
            return true
        } else if text.count == 0 {
            return true
        } else {
            return false
        }
    }
}
extension UIViewController {
    func showOTPViewController() {
        let storyboard = UIStoryboard(name: "otp", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "OTP")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
