//
//  VerifyCodeVC.swift
//  Boilerplate
//
//  Created by Syed Qasim on 31/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class VerifyCodeVC: ViewController {
    @IBOutlet weak var txtFldVerificationCode: UITextField!
    
    @IBOutlet weak var txtFldCode1: UITextField!
    @IBOutlet weak var txtFldCode2: UITextField!
    @IBOutlet weak var txtFldCode3: UITextField!
    @IBOutlet weak var txtFldCode4: UITextField!
    
    class func verifyCodeVC()->VerifyCodeVC{
        
        return VerifyCodeVC(nibName: String(describing: VerifyCodeVC.self), bundle: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Verify Code"
        self.txtFldVerificationCode.becomeFirstResponder()
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
     public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        switch range.length {
        case 0:
            self.txtFldCode1.text = string
            break
        case 1:
            self.txtFldCode1.text = string
            break
        case 2:
            self.txtFldCode1.text = string
            break
        case 3:
            self.txtFldCode1.text = string
            break
        default:
            return false
        }
        return true
    }
}
