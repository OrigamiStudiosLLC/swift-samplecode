//
//  ViewController.swift
//  Boilerplate
//
//  Created by Syed Qasim on 26/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func showAlertWith(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .`default`, handler: { _ in
            
        }))
        self.present(alert, animated: true, completion: nil)

    }

}

