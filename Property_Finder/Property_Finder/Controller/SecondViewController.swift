//
//  SecondViewController.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 27/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import UIKit

protocol ButtonInformationProtocol {
    func buttonInformation(order: String)
}

class SecondViewController: UIViewController {

    //Delegate
    var delegate: ButtonInformationProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //NavigationBarSetup
        navigationBarSetup()
        
    }
    
    @IBAction func priceAscendingPressed(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.buttonInformation(order: "pa")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func priceDescendingPressed(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.buttonInformation(order: "pd")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func bedsAscendingPressed(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.buttonInformation(order: "ba")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func bedsDescendingPressed(_ sender: UIButton) {
        if let delegate = self.delegate {
            delegate.buttonInformation(order: "bd")
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}

extension SecondViewController {
    
    //NavigationBarSetup
    func navigationBarSetup() {
        self.title = "Sort"
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
}
