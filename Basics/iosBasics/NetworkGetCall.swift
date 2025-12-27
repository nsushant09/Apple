//
//  NetworkGetCall.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/11/22.
//

import SwiftUI


class NetworkViewModel : ObservableObject{
    
    @Published var listOfPosts = [Post]()
    
    
    init(){
        getData()
    }
    
    func getData(){
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts") else {return}
        
        //perform api call
        let task = URLSession.shared.dataTask(with: url){ [weak self]data, _, error in
            guard let data = data , error == nil else{
                return
            }
            
            //convert to json
            do{
                let posts = try JSONDecoder().decode([Post].self, from:data)
                DispatchQueue.main.async{
                    self?.listOfPosts = posts
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

struct NetworkGetCall: View {
    
    @EnvironmentObject var viewModel : NetworkViewModel
    
    var body: some View {
        List{
            ForEach(viewModel.listOfPosts){post in
                VStack(spacing: 20){
                    Text(post.title ?? "")
                        .foregroundColor(Color.red)
                    Text(post.body ?? "")
                }
            }
        }
    }
}

struct Post : Identifiable,Codable, Hashable{
    let userId : Int?
    let id : Int?
    let title : String?
    let body : String?
}

struct NetworkGetCall_Previews: PreviewProvider {
    static var previews: some View {
        NetworkGetCall()
            .environmentObject(NetworkViewModel())
    }
}
