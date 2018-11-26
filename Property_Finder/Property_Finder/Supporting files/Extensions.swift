//
//  Extensions.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import UIKit

extension UIViewController {
    
    //To show activityIndicator
    func showActivityIndicator(view: UIView) -> UIActivityIndicatorView {
        
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        view.addSubview(activityIndicator)
        activityIndicator.backgroundColor = UIColor.black
        activityIndicator.layer.cornerRadius = 5
        activityIndicator.center = view.center
        activityIndicator.startAnimating()
        return activityIndicator
    }
    
    //To Show the Alert/Error/Success
    func displayAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}
