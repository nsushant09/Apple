//
//  LazyGrid.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/7/22.
//

import SwiftUI

struct LazyGrid: View {
    
    let columns : [GridItem] = [
        GridItem(.fixed(50), spacing: nil, alignment: nil),
        GridItem(.fixed(50), spacing:nil, alignment: nil),
        GridItem(.fixed(50), spacing:nil, alignment: nil),
        GridItem(.fixed(50), spacing:nil, alignment: nil),
        GridItem(.fixed(50), spacing:nil, alignment: nil),
        GridItem(.flexible(minimum: 0,maximum: .infinity), spacing:nil, alignment:nil),
    ]
    
    let likeInstaColumns : [GridItem] = [
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing:nil, alignment:nil),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing:nil, alignment:nil),
        GridItem(.flexible(minimum: 0, maximum: .infinity), spacing:nil, alignment:nil)
    ]
    
    var body: some View {
        //it is usually used with foreach and scrollviews
        
        ScrollView{
//            Rectangle()
//                .fill(Color.white)
//                .frame(height:400)
            
            LazyVGrid(columns: likeInstaColumns,
                      alignment: .center,
                      spacing: 10,
                      pinnedViews: [.sectionHeaders],
                      content: {
                
                Section(header:Text("Section 1")
                    .foregroundColor(.brown)
                    .font(.title)
                    .fontWeight(.semibold)){
                    ForEach(0..<50){index in
                        Rectangle()
                            .frame(height:150)
                    }
                }
            

            }).padding()
        }
    }
}

struct LazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LazyGrid()
    }
}
