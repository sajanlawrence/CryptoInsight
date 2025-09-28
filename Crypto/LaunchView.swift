//
//  LaunchView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 28/09/25.
//

import SwiftUI
import Combine

struct LaunchView: View {
    let loadingText: [String] = "Loading all the data...".map({ String($0) })
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var count = 0
    @State private var loop = 0
    @Binding var showLaunchView: Bool
    var body: some View {
        ZStack{
            Color.black
            VStack{
                ZStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                    Text("Crypto Insight")
                        .foregroundStyle(.white)
                        .bold()
                        .font(.largeTitle)
                        .offset(y: 70)
                    HStack(spacing: 0){
                        ForEach(0..<loadingText.count) { index in
                            Text(loadingText[index])
                                .foregroundStyle(.white)
                                .bold()
                                .font(.subheadline)
                                .italic()
                                .offset(y: count == index ? -10 : 0)
                        }
                    }
                    .offset(y: 110)
                }
            }
        }
        .ignoresSafeArea()
        .onReceive(timer) { _ in
            withAnimation(.spring){
                if count == loadingText.count - 1{
                    count = 0
                    loop += 1
                    if loop == 3{
                        showLaunchView.toggle()
                    }
                }else{
                    count += 1
                }
            }
            
        }
    }
}

#Preview {
    LaunchView(showLaunchView: .constant(true))
}
