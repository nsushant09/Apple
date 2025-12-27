//
//  KuraKaniMainView.swift
//  iosBasics
//
//  Created by SushantNeupane on 12/8/22.
//

import SwiftUI

struct KuraKaniMainView: View {
    
    let userList = [
        User(id: 1, image: "", userName: "Kushal Bhandari"),
        User(id: 2, image: "", userName: "Swostik Gautam"),
        User(id: 4, image: "", userName: "Shreejwal Giri"),
        User(id: 5, image: "", userName: "Indra Rana"),
        User(id: 6, image: "", userName: "Shreejan Shrestha"),
        User(id: 7, image: "", userName: "Nabin Shrestha"),
        User(id: 8, image: "", userName: "Swornim Shah"),
        User(id: 9, image: "", userName: "Suman Ghimire"),
        User(id: 10, image: "", userName: "Yogesh Bhatta"),
        User(id: 11, image: "", userName: "Utsab Sapkota"),
        User(id: 12, image: "", userName: "Pratyush Adhikari"),
        User(id: 13, image: "", userName: "Suprit Gautam"),
        User(id: 14, image: "", userName: "Aayush Gautam")
    ]
    
    let chatList = [
        LatestChatMessage(user: User(id: 1, image: "", userName: "Kushal Bhandari"),
                          latestMessage: "Latest Message 1"),
        LatestChatMessage(user: User(id: 2, image: "", userName: "Sushant Neupane"),
                          latestMessage: "Latest Message 2"),
        LatestChatMessage(user: User(id: 3, image: "", userName: "Swostik Gautam"),
                          latestMessage: "Latest Message 3"),
        LatestChatMessage(user: User(id: 4, image: "", userName: "Indra Rana"),
                          latestMessage: "Latest Message 4"),
        LatestChatMessage(user: User(id: 5, image: "", userName: "Shreejan Shrestha"),
                          latestMessage: "Latest Message 5"),
        LatestChatMessage(user: User(id: 6, image: "", userName: "Swornim Shah"),
                          latestMessage: "Latest Message 6"),
        
    ]
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                
                HStack{
                    Text("Sushant Neupane")
                        .baselineOffset(4)
                        .kerning(1)
                        .foregroundColor(Color.brown)
                        .font(.system(size : 24, weight : .semibold, design : .monospaced))
                        .frame(alignment : .leading)
                    
                    
                    Spacer()
                    
                    
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 32))
                        .frame(width: 32, height: 32)
                    
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundColor(Color.gray)
                        .aspectRatio(contentMode: .fit)
                        .font(.system(size: 32))
                        .frame(width: 32, height: 32)
                        .onTapGesture {
                            GradiantBootcamp()
                        }
                    
                }.padding(.bottom)
                
                ScrollView{
                    storyUserView(user: userList)
                    latestChatView(chatList: chatList)
                }
                
            }.padding()
            
        }.navigationBarHidden(true)
        
    }
}

struct storyUserView : View{
    
    let user : [User]
    var body : some View{
        
        ScrollView(.horizontal, showsIndicators: false, content:{
            HStack{
                ForEach(user) { user in
                    NavigationLink(destination: textBootcamp(text : user.userName ?? ""), label: {
                        VStack(){
                            Circle()
                                .fill(Color.brown)
                                .frame(width: 32, height: 32, alignment: .center)
                                .overlay(
                                    Image(systemName: "person.fill")
                                        .foregroundColor(Color.white)
                                )
                            
                            Text(user.userName ?? "")
                                .foregroundColor(Color.brown)
                                .lineLimit(4)
                                .font(.system(size: 12, weight: .light, design: .serif))
                        }
                        .frame(maxWidth: 60, minHeight: 70)
                        .padding(.horizontal, 2)
                    })
                    
                }
            }
        })
    }
    
}

struct latestChatView : View{
    let chatList : [LatestChatMessage]
    var body : some View{
        ScrollView{
            VStack{
                ForEach(chatList) { list in
                    NavigationLink(destination: NoteItemCardView(
                        title: list.user.userName ?? "", description: list.latestMessage, date: "", color: Color.brown
                    ), label: {
                        
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color.gray.opacity(0.07))
                            .frame(width: .infinity, height: 80, alignment: .center)
                            .overlay(content: {
                                HStack{
                                    Image(systemName: "person.fill")
                                        .font(.system(size:32))
                                        .frame(width:32, height:32, alignment: .leading)
                                        .foregroundColor(Color.gray)
                                    
                                    VStack(alignment: .leading, content: {
                                        Text(list.user.userName ?? "")
                                            .baselineOffset(2)
                                            .foregroundColor(Color.brown)
                                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                                        
                                        Text(list.latestMessage)
                                            .foregroundColor(Color.black)
                                            .font(.system(size:14, weight: .regular, design: .rounded))
                                    }).padding(.leading)
                                    Spacer()
                                }.padding()
                            })
                        
                    })
                }
            }
        }
    }
}

struct LatestChatMessage : Identifiable , Codable, Hashable{
    var id: Int?
    let user : User
    let latestMessage : String
}

struct User : Identifiable,Codable, Hashable{
    let id : Int?
    let image : String?
    let userName : String?
}


struct KuraKaniMainView_Previews: PreviewProvider {
    static var previews: some View {
        KuraKaniMainView()
    }
}
