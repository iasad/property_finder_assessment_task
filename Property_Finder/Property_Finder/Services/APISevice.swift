//
//  APISevice.swift
//  Property_Finder
//
//  Created by Asad 'Bunny' on 26/11/2018.
//  Copyright © 2018 Asad 'Bunny'. All rights reserved.
//

import Foundation
import Alamofire

class APIService {
    
    //Singelton Pattern
    static let instance = APIService()
    let defaults = UserDefaults.standard
    
    //To fetch data from server
    func getData(order: String, page: Int, dataHandler: @escaping DataHandler, completion: @escaping CompletionHandler) {
        
        let body: Parameters = [
            "page": page,
            "order": order
        ]
        
        print("URL: \(GET_DATA)\n")
        print("Body: \(body)\n\n\n")
        
        Alamofire.request(GET_DATA, method: .get, parameters: body).responseJSON { (response) in
            
            if response.result.error == nil {
                guard let data = response.data else { return }
                
                do {
                    let baseModel = try JSONDecoder().decode(BaseModel.self, from: data)
                    dataHandler(baseModel)
                    completion(true)
                } catch let jSONError {
                    print("Error: \(jSONError)")
                    completion(false)
                }
            } else {
                print("Something went wrong!")
                completion(false)
            }
        }
    }
}
