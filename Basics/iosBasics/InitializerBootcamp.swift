//
//  InitializerBootcamp.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct InitializerBootcamp: View {
//    create variables outside the body
    
    let backgroundColor : Color
    let count : Int
    let title : String
    
    init(backgroundColor : Color, count : Int, title : String){
        self.backgroundColor = backgroundColor
        self.count = count
        self.title = title
    }
    var body: some View {
        VStack{
            Text("\(count)")
                .font(.headline)
                .foregroundColor(.white)
                .underline()
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
        }.frame(width: 150, height: 150)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

enum Fruit{
    case Apple
    case Orange
    case Mango
}

struct InitializerBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        InitializerBootcamp(backgroundColor: .orange,count : 25, title: "Oranges")
    }
}
