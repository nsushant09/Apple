//
//  NetworkManager.swift
//  iosBasics
//
//  Created by SushantNeupane on 7/23/23.
//

import Foundation

class NetworkManager<DataType : Decodable>{
    
    init(){
    
    }
    
    func getData(url: String, completion: @escaping ([DataType]?, Error?) -> Void) {
        guard let url = URL(string: url) else {
            completion(nil, nil) // or completion(nil, YourError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, nil) // or completion(nil, YourError.noData)
                return
            }
            
            do {
                let listOfData = try JSONDecoder().decode([DataType].self, from: data)
                completion(listOfData, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
