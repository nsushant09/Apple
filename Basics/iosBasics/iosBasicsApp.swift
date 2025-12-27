//
//  iosBasicsApp.swift
//  iosBasics
//
//  Created by SushantNeupane on 6/29/22.
//

import SwiftUI

@main
struct iosBasicsApp: App {
    
    @StateObject var networkViewModel = NetworkViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkViewModel)
        }
    }
}
