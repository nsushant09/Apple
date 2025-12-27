//
//  NoteItemCardView.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/11/22.
//

import SwiftUI

struct NoteItemCardView: View {
    
    let title : String
    let description : String
    let date : String
    let color : Color
    var body: some View {
        
        ZStack(alignment:.top){
            
            Rectangle()
                .foregroundColor(color)
                .cornerRadius(16)
            
            VStack(alignment : .leading, spacing:20){
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .semibold, design: .rounded))
                    .lineLimit(1)
                    
                Text(description)
                    .lineLimit(3)
                    .foregroundColor(.black.opacity(0.8))
                
                HStack{
                    Spacer()
                    Text(date).fontWeight(.light)
                        .kerning(2)
                }
            }.padding()
        
        }
        .frame(minWidth:300, maxHeight:200, alignment: .topLeading)
        .padding()
     
        
    }
}

struct NoteItemCardView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemCardView(title : "This is title of multiple line",
                         description: "This is the description of the note card that we will be using right now in this moment of time",
                         date : "22/10/22",
                         color: Color.red.opacity(0.3)
        )
    }
}
