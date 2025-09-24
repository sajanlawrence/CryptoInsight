//
//  HomeView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 24/09/25.
//

import SwiftUI

struct HomeView: View {
    @State private var showPortFolio: Bool = false
    var body: some View {
        ZStack{
            Color.theme.background
                .ignoresSafeArea()
            VStack{
                headerView
                Spacer(minLength: 0)
            }
        }
    }
}

extension HomeView{
    private var headerView: some View{
        HStack{
            CircleButtonView(iconName: showPortFolio ? "plus" : "info")
                .animation(.none, value: showPortFolio)
                .background {
                    CircleButtonAnimationView(animate: $showPortFolio)
                }
            Spacer()
            Text(showPortFolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(Color.theme.accent)
                .animation(.none, value: showPortFolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortFolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring){
                        showPortFolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    HomeView()
}
