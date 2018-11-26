//
//  Constants.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import Foundation

//BASE_URL
let BASE_URL = "https://www.propertyfinder.ae/"

let GET_DATA = "\(BASE_URL)mobileapi"

//Compeltion handler
typealias CompletionHandler = (_ Success: Bool) -> ()
typealias DataHandler = (_ data: BaseModel) -> ()
