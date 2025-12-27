//
//  ImageBootcamp.swift
//  iosBasics
//
//  Created by SushantNeupane on 6/29/22.
//

import SwiftUI

struct ImageBootcamp: View {
    private let imageString : String = "imgString"
    var body: some View {
        ScrollView{
        
            VStack{
                //for circular you can put radius half of width if the image is square
                //the better way is to use clipShape(Shape())
                Image("MyImage")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300, alignment: .center)
                    .overlay(
                        Text("Sushant Neupane")
                            .foregroundColor(Color.white),alignment: .bottom
                    )
                //            .clipShape(Circle())
                
                // if you uploaded an icon as an image and want to change the color / tint
                //        use renderingMode(.template)
                // and then change the color using foreground color , make sure the icon has a transparent background
                Spacer(minLength: 50)
                AsyncImage(url: URL(string : imageString)){ image in
                    image.resizable()
                    
                }placeholder: {
                    Color.red
                }.aspectRatio(contentMode: .fit)
                
            }
        }.padding(.leading,16)
            .padding(.trailing,16)
        
    }
}

struct ImageBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ImageBootcamp()
    }
}
