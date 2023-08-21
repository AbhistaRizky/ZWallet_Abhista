//
//  signUpViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 12/08/23.
//

import UIKit

class SignUpViewController:  UIViewController {
    
    
    @IBOutlet weak var CustomView: CustomLogin!
    @IBOutlet weak var usernameIconImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameSeparator: UIView!
    
    
    @IBOutlet weak var emailIconImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailSeparator: UIView!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordIconImageView: UIImageView!
    @IBOutlet weak var passwordSeparator: UIView!
    
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: CustomButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        AuthNetwork().signUp(username: usernameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!) { data, error in
            if let status = data {
                UserDefaults.standard.integer(forKey: "status")
                self.showOTPViewController()
            } else {
                
            }
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        showLoginViewController()
    }
    
    
    func setup() {
        
        CustomView.dropShadow()
        usernameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let text1 = "Already have an account?"
        let text2 = "Let's Login"
        
        let loginText = NSMutableAttributedString(string: " \(text1) \(text2)")
        loginText.addAttributes(
            [
                .foregroundColor: UIColor(named: "Abu")!,
                .font: UIFont.systemFont(ofSize: 14, weight: .medium)
            ],
            range: NSString(string: loginText.string).range(of: text1)
        )
        loginText.addAttributes(
            [
                .foregroundColor: UIColor(named: "Primary")!,
                .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ],
            range: NSString(string: loginText.string).range(of: text2)
        )
        loginButton.setAttributedTitle(loginText, for: .normal)
    }
    
    @IBAction func tooglePasswordSecure(_ sender: Any) {
        let isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = isSecureTextEntry
        if #available(iOS 13.0, *) {
            showPasswordButton.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye"), for: .normal)
        } else {
            
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        if textField == usernameTextField {
            if text.isUsername && (emailTextField.text ?? "").isEmail && (passwordTextField.text ?? "").isPassword
            {
                signUpButton.backgroundColor = UIColor(named: "Primary")
                signUpButton.tintColor = UIColor.white
                signUpButton.isEnabled = true
            } else {
                signUpButton.backgroundColor = UIColor(named: "Abu")
                signUpButton.tintColor = UIColor.lightGray
                signUpButton.isEnabled = false
            }
        } else if textField == emailTextField {
            if text.isEmail && (passwordTextField.text ?? "").isPassword && (usernameTextField.text ?? "").isUsername {
                signUpButton.backgroundColor = UIColor(named: "Primary")
                signUpButton.tintColor = UIColor.white
                signUpButton.isEnabled = true
            } else {
                signUpButton.backgroundColor = UIColor(named: "Abu")
                signUpButton.tintColor = UIColor.lightGray
                signUpButton.isEnabled = false
            }
        }else if textField == passwordTextField {
            if text.isPassword && (emailTextField.text ?? "").isEmail && (usernameTextField.text ?? "").isUsername {
                signUpButton.backgroundColor = UIColor(named: "Primary")
                signUpButton.tintColor = UIColor.white
                signUpButton.isEnabled = true
            } else {
                signUpButton.backgroundColor = UIColor(named: "Abu")
                signUpButton.tintColor = UIColor.lightGray
                signUpButton.isEnabled = false
            }
        }
        return true
    }
    //    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        switch textField {
        case usernameTextField:
            usernameIconImageView.tintColor = UIColor(named: "Primary")
            usernameSeparator.backgroundColor = UIColor(named: "Primary")
        case emailTextField:
            emailIconImageView.tintColor = UIColor(named: "Primary")
            emailSeparator.backgroundColor = UIColor(named: "Primary")
        case passwordTextField:
            passwordIconImageView.tintColor = UIColor(named: "Primary")
            passwordSeparator.backgroundColor = UIColor(named: "Primary")
        default:
            break
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch textField {
        case usernameTextField:
            if !(usernameTextField.text ?? "").isEmpty {
                usernameIconImageView.tintColor = UIColor(named: "Primary")
                usernameSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                usernameIconImageView.tintColor = UIColor(named: "Abu")
                usernameSeparator.backgroundColor = UIColor(named: "Abu")
            }
        case emailTextField:
            if !(emailTextField.text ?? "").isEmpty {
                emailIconImageView.tintColor = UIColor(named: "Primary")
                emailSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                emailIconImageView.tintColor = UIColor(named: "Abu")
                emailSeparator.backgroundColor = UIColor(named: "Abu")
            }
        case passwordTextField:
            if !(passwordTextField.text ?? "").isEmpty {
                passwordIconImageView.tintColor = UIColor(named: "Primary")
                passwordSeparator.backgroundColor = UIColor(named: "Primary")
            }else {
                passwordIconImageView.tintColor = UIColor(named: "Abu")
                passwordSeparator.backgroundColor = UIColor(named: "Abu")
            }
        default:
            break
        }
        
    }
}
extension UIViewController {
    func showSignUpViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SignUp")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
