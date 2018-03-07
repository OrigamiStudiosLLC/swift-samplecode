//
//  LoginVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 26/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit


class LoginVC: ViewController {
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Login"
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
    @IBAction func onTapLogin(_ sender: Any) {
        if self.validateFields(){
        self.hitLoginService()
        }
    }
    @IBAction func onTapSignup(_ sender: Any) {
        self.navigationController?.pushViewController(SignupVC.signupVC(), animated: true)
    }
    @IBAction func onTapForgotPassword(_ sender: Any) {
        self.navigationController?.pushViewController(ForgotPasswordVC.forgotPasswordVC(), animated: true)
    }
    // MARK: - Custom Methods
    func validateFields() -> Bool{
        
        if !self.txtFldEmail.isValidField() {
            self.showAlertWith(title: "Email is not valid", message: "")
            return false
        }
        if !self.txtFldPassword.isValidField() {
            self.showAlertWith(title: "Password is not valid", message: "")
            return false
        }
        return true
    }
    
    func hitLoginService() {
        self.view.showLoading()
        APIManager.sharedInstance.opertationWithRequest(withApi: API.loginUser(email: self.txtFldEmail.text, password: self.txtFldPassword.text), completion:{(APIResponse) in
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
