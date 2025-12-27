//
//  Scrollview.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct Scrollview: View {
    var body: some View {
        
        // use lazyVStack or LazyHStack to download only those data that are currently required at the ui
        // to trun of the indicator use showIndicator off
        ScrollView{
            VStack{
                //netflix type design
                ScrollView{
                    VStack(alignment: .leading, content: {
                        ForEach(0..<10){index in
                            Text("This is list \(index)")
                                .padding(.leading, 16)
                                .frame(alignment: .leading)
                            
                            ScrollView(.horizontal, showsIndicators: false, content:{
                                HStack{
                                    ForEach(0..<20){index in
                                        RoundedRectangle(cornerRadius: 25)
                                            .fill(Color.white)
                                            .frame(width:200, height:150)
                                            .shadow(radius: 10)
                                            .padding()
                                    }
                                }
                            })
                        }
                    })
                }
                
                ScrollView(.horizontal, showsIndicators: false, content:{
                    HStack{
                        ForEach(0..<50){index in
                            Rectangle()
                                .fill(Color.red)
                                .frame(width:150,height:100)
                        }
                    }
                })
                ScrollView(.vertical, showsIndicators: true, content:{
                    VStack{
                        ForEach(0..<50){index in
                            Rectangle()
                                .fill(Color.blue)
                                .frame(height:300)
                        }
                    }
                })
            }
        }
        
        
        
    }
    
    struct netflixDesign : View {
        var body : some View{ScrollView{
            VStack{
                ForEach(0..<10){index in
                    ScrollView(.horizontal, showsIndicators: false, content:{
                        HStack{
                            ForEach(0..<20){index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width:200, height:150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
        }
    }
}

struct Scrollview_Previews: PreviewProvider {
    static var previews: some View {
        Scrollview()
    }
}
