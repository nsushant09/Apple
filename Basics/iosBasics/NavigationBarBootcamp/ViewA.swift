//
//  ViewA.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/10/22.
//

import SwiftUI

struct ViewA: View {
    var body: some View {
        
        ScrollView{
            ZStack{
                Color.red
                    .frame(height: 5000)
                
                Image(systemName: "phone.fill")
                    .foregroundColor(.white)
                    .font(.system(size:100.0))
            }
        }
    }
}

struct ViewA_Previews: PreviewProvider {
    static var previews: some View {
        ViewA()
    }
}
