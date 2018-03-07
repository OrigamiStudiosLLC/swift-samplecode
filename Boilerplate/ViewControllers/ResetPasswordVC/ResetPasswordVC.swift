//
//  ResetPasswordVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 31/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class ResetPasswordVC: ViewController {

    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldCode: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldConfirmPaasword: UITextField!
    
    
    class func resetPasswordVC()->ResetPasswordVC{
        
        return ResetPasswordVC(nibName: String(describing: ResetPasswordVC.self), bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    // MARK: - IBAction
    @IBAction func onTapSubmit(_ sender: Any) {
    }
    // MARK: - Custom Methods
    func validateFields() -> Bool{
        
        if !self.txtFldEmail.isValidField() {
            self.showAlertWith(title: "Email is not valid", message: "")
            return false
        }
        if !self.txtFldCode.isValidField() {
            self.showAlertWith(title: "Password is not valid", message: "")
            return false
        }
        return true
    }
    
    func hitLoginService() {
        self.view.showLoading()
        APIManager.sharedInstance.opertationWithRequest(withApi: API.resetPassword(email: self.txtFldEmail.text!, code: self.txtFldCode.text!, password: self.txtFldPassword.text!, confirmPassword: self.txtFldConfirmPaasword.text!), completion:{(APIResponse) in
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
