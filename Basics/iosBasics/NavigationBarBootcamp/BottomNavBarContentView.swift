//
//  BottomNavBarContentView.swift
//  iosBasics
//
//  Created by SushantNeupane on 9/10/22.
//

import SwiftUI

struct BottomNavBarContentView: View {
    
    @State var tabColor : Color!
    
    var body: some View {
        VStack{
            
            TabView{
                ViewA()
                    .tabItem(){
                        Image(systemName:"phone.fill")
                            .foregroundColor(Color.red)
                        Text("Calls")
                    }.onAppear(perform: {tabColor = Color.red})
                
                
                ViewB()
                    .tabItem(){
                        Image(systemName:"person.3.fill")
                        Text("Contacts")
                    }.onAppear(perform: {tabColor = Color.blue})
                
                ViewC()
                    .tabItem(){
                        Image(systemName: "slider.horizontal.3")
                        Text("Settings")
                    }.onAppear(perform: {tabColor = Color.green})
            }.accentColor(tabColor ?? Color.accentColor)
                .animation(.linear, value: 0)
        }

    }
}

struct BottomNavBarContentView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBarContentView()
    }
}
