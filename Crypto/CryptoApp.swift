//
//  CryptoApp.swift
//  Crypto
//
//  Created by Sajan Lawrence on 24/09/25.
//

import SwiftUI

@main
struct CryptoApp: App {
    @State private var showLaunchView: Bool = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                NavigationStack{
                    HomeView()
                }
                if showLaunchView{
                    LaunchView(showLaunchView: $showLaunchView)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}
