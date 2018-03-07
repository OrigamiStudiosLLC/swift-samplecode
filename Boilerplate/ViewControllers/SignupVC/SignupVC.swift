//
//  SignupVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 31/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class SignupVC: ViewController {
    
    class func signupVC()->SignupVC{
        
        return SignupVC(nibName: String(describing: SignupVC.self), bundle: nil)
    }
    @IBOutlet weak var txtFldFirstName: UITextField!
    @IBOutlet weak var txtFldLastName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldConfirmPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Signup"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: - IBActions
    @IBAction func onTapSignup(_ sender: Any) {
        if self.validateFields(){
            self.hitSignupService()
        }
    }
    // MARK: - Custom Methods
    func validateFields() -> Bool{
        if self.txtFldFirstName.isValidField() {
            self.showAlertWith(title: "First name is empty", message: "")
            return false
        }
        if self.txtFldLastName.isValidField() {
            self.showAlertWith(title: "Last name is empty", message: "")
            return false
        }
        if !self.txtFldEmail.isValidField() {
            self.showAlertWith(title: "Email is not valid", message: "")
            return false
        }
        if self.txtFldPassword.isValidField() {
            self.showAlertWith(title: "Password is not valid", message: "")
            return false
        }
        if self.txtFldPassword.text != self.txtFldConfirmPassword.text {
            self.showAlertWith(title: "First name is empty", message: "")
            return false
        }
        return true
    }
    
    func hitSignupService() {
        self.view.showLoading()
        APIManager.sharedInstance.opertationWithRequest(withApi: API.registerUser(firstName: txtFldFirstName.text!, lastName: self.txtFldLastName.text!, username: txtFldEmail.text!, password: txtFldPassword.text!, confirmPassword: txtFldConfirmPassword.text!), completion:{(APIResponse) in
            self.view.hideLoading()
            switch APIResponse {
            case .Success(let data):
                print("login response ", data as Any)
                self.showAlertWith(title: "Success", message: "Login successful")
                break
            case .Failure(let error):
                print("login error reposne ", error as Any)
                self.showAlertWith(title: "Error", message: error!)
                break
                
            }
        })
    }
}
