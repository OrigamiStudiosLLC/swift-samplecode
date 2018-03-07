//
//  ForgotPasswordVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 31/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class ForgotPasswordVC: ViewController {

    
    @IBOutlet weak var txtFldEmail: UITextField!
    
    class func forgotPasswordVC()->ForgotPasswordVC{
        
        return ForgotPasswordVC(nibName: String(describing: ForgotPasswordVC.self), bundle: nil)
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
        if validateFields(){
            self.hitForgotPasswordService()
        }
    }
    
    // MARK: - Custom Methods
    func validateFields() -> Bool{
        
        if !self.txtFldEmail.isValidField() {
            self.showAlertWith(title: "Email is not valid", message: "")
            return false
        }
        
        return true
    }
    
    func hitForgotPasswordService() {
        self.view.showLoading()
        APIManager.sharedInstance.opertationWithRequest(withApi: API.forgotPassword(email: self.txtFldEmail.text!), completion:{(APIResponse) in
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
