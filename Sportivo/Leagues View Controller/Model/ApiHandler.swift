//
//  ApiHandler.swift
//  Sportivo
//
//  Created by adham ragap on 18/09/2025.
//

import Foundation
protocol ApiManager {
   static func getData<T:Codable>(url: String,complationHandler: @escaping (T?,Error?)->Void)
}
class ApiHandler:ApiManager{
   static func getData<T:Codable>(url: String, complationHandler: @escaping (T?, Error?) -> Void) {
        if let  url = URL(string: url){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if error == nil {
                    guard let data = data else {
                        return
                    }
                    do{
                        let fetchedData = try JSONDecoder().decode(T.self, from: data)
                        complationHandler(fetchedData,nil)
                       
                    }catch(let error as NSError){
                      print("cannot decoding because : \(error)")
                        complationHandler(nil,error)
                    }
                    
                }
                else {
                    complationHandler(nil,error)
                }
            }.resume()
        }
    }
    
    
}
