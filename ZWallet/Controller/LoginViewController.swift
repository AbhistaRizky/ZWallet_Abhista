//
//  LoginViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 12/08/23.
//

import UIKit

class LoginViewController: UIViewController {
   
    
    @IBOutlet weak var CustomView: CustomLogin!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailIconImageView: UIImageView!
    @IBOutlet weak var emailSeparator: UIView!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordIconImageView: UIImageView!
    @IBOutlet weak var passwordSeparator: UIView!
    
    @IBOutlet weak var loginButton: CustomButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    @IBAction func loginButtonTapped(_ sender: Any) {
        AuthNetwork().login(email: emailTextField.text!, password: passwordTextField.text!) { data, error in
            if let loginData = data {
                UserDefaults.standard.set(loginData.token, forKey: "AccessToken")
                self.showHomeViewController()
            } else {

            }
        }
    }
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
        showResetPasswordViewController()
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        showSignUpViewController()
    }
    
    @IBAction func showPasswordButtonTapped(_ sender: Any) {
        let isSecureTextEntry = !passwordTextField.isSecureTextEntry
        passwordTextField.isSecureTextEntry = isSecureTextEntry
        if #available(iOS 13.0, *) {
            showPasswordButton.setImage(isSecureTextEntry ? UIImage(systemName: "eye.slash") : UIImage(systemName: "eye"), for: .normal)
        } else {
            
        }
    }
    
    func setup() {

        CustomView.dropShadow()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        let text1 = "Don't have an account yet?"
        let text2 = "Sign Up"
        
        
        let attText = NSMutableAttributedString(string: "\(text1) \(text2)")
        attText.addAttributes(
            [
                .foregroundColor: UIColor(named: "Abu")!,
                .font: UIFont.systemFont(ofSize: 15, weight: .regular)
            ],
            range: NSString(string: attText.string).range(of: text1)
        )
        attText.addAttributes(
            [
                .foregroundColor: UIColor(named: "Primary")!,
                .font: UIFont.systemFont(ofSize: 14, weight: .regular),
                .underlineStyle: NSUnderlineStyle.single.rawValue
            ],
            range: NSString(string: attText.string).range(of: text2)
        )
        signUpButton.setAttributedTitle(attText, for: .normal)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        
        if textField == emailTextField {
            if text.isEmail && (passwordTextField.text ?? "").isPassword {
                loginButton.backgroundColor = UIColor(named: "Primary")
                loginButton.tintColor = UIColor.white
                loginButton.isEnabled = true
            } else {
                loginButton.backgroundColor = UIColor(named: "Abu")
                loginButton.tintColor = UIColor.lightGray
                loginButton.isEnabled = false
            }
        } else if textField == passwordTextField {
            if textField == passwordTextField {
                if text.isPassword && (emailTextField.text ?? "").isEmail {
                    loginButton.backgroundColor = UIColor(named: "Primary")
                    loginButton.tintColor = UIColor.white
                    loginButton.isEnabled = true
                } else {
                    loginButton.backgroundColor = UIColor(named: "Abu")
                    loginButton.tintColor = UIColor.lightGray
                    loginButton.isEnabled = false
                }
            }
        }
            return true
    }
        func textFieldDidBeginEditing(_ textField: UITextField) {
            switch textField {
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
    func showLoginViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "Login")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
