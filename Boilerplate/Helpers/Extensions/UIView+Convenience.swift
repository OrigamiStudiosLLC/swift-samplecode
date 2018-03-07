//
//  UIView+Convenience.swift
//  Boilerplate
//
//  Created by Syed Qasim on 26/01/2018.
//  Copyright © 2018 Crewlogix. All rights reserved.
//

import UIKit
import AASquaresLoading

extension UIView
{
    /// no need to write code every time you load a nib of UIView just do this // let homeView:HomeView  = HomeView.loadFromXib()
    static func loadFromXib<T>(withOwner: Any? = nil, options: [AnyHashable : Any]? = nil) -> T where T: UIView
    {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? T else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
/// show an activity indicator on any specific UIView even in a nested view
    func showLoading() {
        DispatchQueue.main.async {

            self.squareLoading.color = UIColor.black
            self.squareLoading.backgroundColor = UIColor.clear
            self.squareLoading.start(0.0)

        }
    }
    /// hide activity indicator from a UIView
    func hideLoading() {
        DispatchQueue.main.async {
            self.squareLoading.stop(0.0)

        }
    }
}
extension UIViewController {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIViewController? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiate(withOwner: nil, options: nil)[0] as? UIViewController
}
}
