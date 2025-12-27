//
//  ButtonNavigation.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/9/22.
//

import SwiftUI

struct ButtonNavigation: View {
    var body: some View {

        NavigationView{
            NavigationLink(destination: shapesBootcamp(), label: {
                VStack{
                    ZStack(alignment: .bottom){
                        Image("MyImage")
                        Text("Shapes Bootcamp")
                            .foregroundColor(.white)
                    }
                }
                    
            })
        }
            
        
        
    }
}

struct ButtonNavigation_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNavigation()
    }
}
