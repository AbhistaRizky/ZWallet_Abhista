//
//  resetPasswordViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 15/08/23.
//

import UIKit

class resetPasswordViewController: UIViewController {
    
    @IBOutlet weak var confirmEmailTextField: UITextField!
    @IBOutlet weak var confirmEmailIconImageView: UIImageView!
    @IBOutlet weak var confirmEmailSeparator: UIView!
    
    
    @IBOutlet weak var sendEmailButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setup()
    }
    @IBAction func sendButtonTapped(_ sender: Any) {
        showResetPassword2ViewController()
        
        
    }
    func setup() {
        confirmEmailTextField.delegate = self
    }
}

extension resetPasswordViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if textField == confirmEmailTextField {
            if text.isEmail {
                sendEmailButton.backgroundColor = UIColor(named: "Primary")
                sendEmailButton.tintColor = UIColor.white
                sendEmailButton.isEnabled = true
            } else {
                sendEmailButton.backgroundColor = UIColor(named: "Abu")
                sendEmailButton.tintColor = UIColor.lightGray
                sendEmailButton.isEnabled = false
            }
        } else {
            
        }
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case confirmEmailTextField:
            confirmEmailIconImageView.tintColor = UIColor(named: "Primary")
            confirmEmailSeparator.backgroundColor = UIColor(named: "Primary")
        default:
            break
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case confirmEmailTextField:
            if !(confirmEmailTextField.text ?? "").isEmpty {
                confirmEmailIconImageView.tintColor = UIColor(named: "Primary")
                confirmEmailSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                confirmEmailIconImageView.tintColor = UIColor(named: "Abu")
                confirmEmailSeparator.backgroundColor = UIColor(named: "Abu")
            }
        default:
            break
        }
    }
}
extension UIViewController {
    func showResetPasswordViewController() {
        let storyboard = UIStoryboard(name: "ForgetPassword", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "reset1")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
