//
//  ProfileViewController.swift
//  ZWallet
//
//  Created by laptop MCO on 15/08/23.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var personalInfoButton: CustomButton2!
    @IBOutlet weak var changePassButton: CustomButton2!
    @IBOutlet weak var changePinButton: CustomButton2!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var logoutButton: CustomButton2!
    
    @IBOutlet weak var switchButton: UISwitch!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profilePhone: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setup()
        setupProf()
    }
    override func viewWillAppear(_ animated: Bool) {
        AuthNetwork().getProfile { data, error in
            if let getProfile = data {
                UserDefaults.standard.set(getProfile.image, forKey: "image")
                UserDefaults.standard.set(getProfile.firstname, forKey: "firstname")
                UserDefaults.standard.set(getProfile.lastname, forKey: "lastname")
                UserDefaults.standard.set(getProfile.phone, forKey: "phone")
                print(getProfile.image)
            } else {
                print ("error")
            }
        }
    }
    func setup() {
        notificationView.layer.cornerRadius = 20
    }
    
    func setupProf() {
//        profileImage.kf.setImage(with: URL(string: Constant.image as? String ?? ""))
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: URL(string: Constant.image as! String)!)
            if let imageData = imageData {
                DispatchQueue.main.async { [self] in
                    profileImage.image = UIImage(data: imageData)
                }
            }
        }
        
        profileName.text = "\(Constant.firstname!)"
        if(Constant.phone as! String != ""){
            profilePhone.text = "\(Constant.phone!)"
        }else {
            profilePhone.text = "087127217712"
        }
    }
    
    @IBAction func switchButtonTapped(_ sender: Any) {
        let state = switchButton.isOn
        switch state {
        case true:
            personalInfoButton.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
            changePassButton.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
            changePinButton.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
            notificationView.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
            logoutButton.layer.backgroundColor = UIColor.opaqueSeparator.cgColor
        case false:
            personalInfoButton.layer.backgroundColor = UIColor.white.cgColor
            changePassButton.layer.backgroundColor = UIColor.white.cgColor
            changePinButton.layer.backgroundColor = UIColor.white.cgColor
            notificationView.layer.backgroundColor = UIColor.white.cgColor
            logoutButton.layer.backgroundColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        AuthNetwork().logout { data in
            if let logoutData = data {
                let alert = UIAlertController(title: "Logout", message: logoutData.message, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default) { action in
                    self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(ok)
                self.present(alert, animated: true)
            }
        }
    }
    
}
extension UIViewController {
    func showProfileViewController() {
        let storyboard = UIStoryboard(name: "TabBar", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "profile")
        navigationController?.pushViewController(viewController, animated: true)
    }
}
