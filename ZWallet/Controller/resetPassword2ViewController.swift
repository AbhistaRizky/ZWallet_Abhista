//
//  resetPassword2ViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 15/08/23.
//

import UIKit

class resetPassword2ViewController: UIViewController {
    
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordIconImageView: UIImageView!
    @IBOutlet weak var newPasswordSeparator: UIView!
    
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordIconImageView: UIImageView!
    @IBOutlet weak var confirmPasswordSeparator: UIView!
    
    
    
    @IBOutlet weak var confirmButton: CustomButton!
    @IBOutlet weak var showNewPassword: UIButton!
    @IBOutlet weak var showConfirmPassword: UIButton!
    
    var email: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setup()
    }
    
    
    @IBAction func showNewPassword(_ sender: Any) {
        let isSecureTextEntry = !newPasswordTextField.isSecureTextEntry
        newPasswordTextField.isSecureTextEntry = isSecureTextEntry
        if #available(iOS 13.0, *) {
            showNewPassword.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye"), for: .normal)
        } else {
            
        }
    }
    @IBAction func showConfirmPassword(_ sender: Any) {
        let isSecureTextEntry = !confirmPasswordTextField.isSecureTextEntry
        confirmPasswordTextField.isSecureTextEntry = isSecureTextEntry
        if #available(iOS 13.0, *) {
            showConfirmPassword.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye"), for: .normal)
        } else {
            
        }
    }
    
    
    func setup() {
        confirmPasswordTextField.delegate = self
        newPasswordTextField.delegate = self
    }
}
extension resetPassword2ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if textField == newPasswordTextField {
            if text.isPassword && (confirmPasswordTextField.text ?? "").isPassword {
                confirmButton.backgroundColor = UIColor(named: "Primary")
                confirmButton.tintColor = UIColor.white
                confirmButton.isEnabled = true
            } else {
                confirmButton.backgroundColor = UIColor(named: "Abu")
                confirmButton.tintColor = UIColor.lightGray
                confirmButton.isEnabled = false
            }
        } else if textField == confirmPasswordTextField {
            if textField == confirmPasswordTextField {
                if text.isPassword && (newPasswordTextField.text ?? "").isPassword {
                    confirmButton.backgroundColor = UIColor(named: "Primary")
                    confirmButton.tintColor = UIColor.white
                    confirmButton.isEnabled = true
                } else {
                    confirmButton.backgroundColor = UIColor(named: "Abu")
                    confirmButton.tintColor = UIColor.lightGray
                    confirmButton.isEnabled = false
                }
            }
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case newPasswordTextField:
            newPasswordIconImageView.tintColor = UIColor(named: "Primary")
            newPasswordSeparator.backgroundColor = UIColor(named: "Primary")
        case confirmPasswordTextField:
            confirmPasswordIconImageView.tintColor = UIColor(named: "Primary")
            confirmPasswordSeparator.backgroundColor = UIColor(named: "Primary")
        default:
            break
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case newPasswordTextField:
            if !(newPasswordTextField.text ?? "").isEmpty {
                newPasswordIconImageView.tintColor = UIColor(named: "Primary")
                newPasswordSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                newPasswordIconImageView.tintColor = UIColor(named: "Abu")
                newPasswordSeparator.backgroundColor = UIColor(named: "Abu")
            }
        case confirmPasswordTextField:
            if !(confirmPasswordTextField.text ?? "").isEmpty {
                confirmPasswordIconImageView.tintColor = UIColor(named: "Primary")
                confirmPasswordSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                confirmPasswordIconImageView.tintColor = UIColor(named: "Abu")
                confirmPasswordSeparator.backgroundColor = UIColor(named: "Abu")
            }
        default:
            break
        }
    }
}

extension UIViewController {
    func showResetPassword2ViewController() {
        let storyboard = UIStoryboard(name: "ForgetPassword", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "reset2")
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}
