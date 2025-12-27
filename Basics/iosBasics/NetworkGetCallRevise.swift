//
//  NetworkGetCallRevise.swift
//  iosBasics
//
//  Created by SushantNeupane on 11/28/22.
//

import SwiftUI

struct NetworkGetCallRevise: View {
    
    @EnvironmentObject var networkVm : NetworkViewModelRevise
    
    var body: some View {
        Text("Hi")
    }
}

class NetworkViewModelRevise : ObservableObject{
    @Published var listOfPost = [Post]()
    init(){
        getData()
    }
    func getData(){
        
        guard let url = URL(string : "https://jsonplaceholder.typicode.com/posts")
        else {return}
        
        //perform api call
        let task = URLSession.shared.dataTask(with: url){[weak self]data, _, error in
            guard let data = data, error == nil else {return}
            
            
            //convert to json
            do{
                let posts = try JSONDecoder().decode([Post].self, from :data)
                DispatchQueue.main.async{
                    self?.listOfPost = posts
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}

struct NetworkGetCallRevise_Previews: PreviewProvider {
    static var previews: some View {
        NetworkGetCallRevise()
            .environmentObject(NetworkViewModelRevise())
    }
}
