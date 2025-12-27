//
//  ViewB.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/10/22.
//

import SwiftUI

struct ViewB: View {
    var body: some View {
        ZStack{
            Color.blue
            
            Image(systemName: "person.3.fill")
                .foregroundColor(.white)
                .font(.system(size:100.0))
        }
    }
}

struct ViewB_Previews: PreviewProvider {
    static var previews: some View {
        ViewB()
    }
}
