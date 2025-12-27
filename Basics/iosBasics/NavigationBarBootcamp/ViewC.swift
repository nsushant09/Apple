//
//  ViewC.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/10/22.
//

import SwiftUI

struct ViewC: View {
    var body: some View {
        ZStack{
            Color.green
            
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.white)
                .font(.system(size:100.0))
        }
    }
}

struct ViewC_Previews: PreviewProvider {
    static var previews: some View {
        ViewC()
    }
}
