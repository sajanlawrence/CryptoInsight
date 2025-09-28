//
//  CoinDetailView.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import SwiftUI

struct CoinDetailView: View {
    let coin: Coin
    @State private var vm = CoinDetailViewModel()
    @State private var showFullDescription: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ScrollView {
            VStack{
                if let detail = vm.coinDetails {
                    if let imageURL = detail.logo,
                       let url = URL(string: imageURL){
                        AsyncImageView(url: url, defaultSystemImageName: "photo")
                            .frame(height: 150)
                    }
                    
                    VStack(spacing: 20) {
                        headerSection
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Status")
                                .font(.title)
                                .bold()
                            HStack {
                                statusLabel(title: "New", value: detail.isNew ?? false ? "Yes" : "No", color: detail.isNew ?? false ? .green : .red)
                                statusLabel(title: "Active", value: detail.isActive ?? false ? "Yes" : "No", color: detail.isActive ?? false ? .green : .red)
                                statusLabel(title: "Open Source", value: detail.openSource ?? false ? "Yes" : "No", color: detail.openSource ?? false ? .green : .red)
                            }
                            Text("Development Status: \(detail.developmentStatus ?? "Unknown")")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            Text("Started: \(formattedDate(detail.startedAt ?? "NA"))")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10){
                            Text("Overview")
                                .font(.title)
                                .bold()
                            Text(detail.description?.strippedHTML ?? "Not available")
                                .foregroundStyle(.secondary)
                                .lineLimit(showFullDescription ? nil : 3)
                            Button {
                                withAnimation(.easeInOut){
                                    showFullDescription.toggle()
                                }
                            } label: {
                                Text(showFullDescription ? "Hide all" : "Read more..")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.blue)
                                    .padding(.vertical, 4)
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Team")
                                .font(.title)
                                .bold()
                            if (detail.team ?? []).count == 0 {
                                Text("No team information available")
                                    .foregroundColor(.secondary)
                                    .italic()
                            } else {
                                ForEach(detail.team ?? [], id: \.id) { member in
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(member.name ?? "")
                                            .fontWeight(.semibold)
                                        Text(member.position ?? "")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                                    .padding(.vertical, 4)
                                    Divider()
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Technical Details")
                                .font(.title)
                                .bold()
                            infoRow(title: "Proof Type", value: detail.proofType ?? "NA")
                            infoRow(title: "Hardware Wallet", value: detail.hardwareWallet ?? false ? "Supported" : "Not Supported")
                            infoRow(title: "Organization", value: detail.orgStructure ?? "NA")
                            infoRow(title: "Hash Algorithm", value: detail.hashAlgorithm ?? "NA")
                            infoRow(title: "Type", value: coin.type.capitalized)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        VStack(alignment: .leading){
                            if let websiteURL = detail.links?.website?.first,
                               let url = URL(string: websiteURL){
                                Link("Website", destination: url)
                                    .foregroundStyle(.blue)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    
                }
            }
            .onAppear{
                vm.getCoinDetails(for: coin)
            }
        }
    }
    
}

extension CoinDetailView{
    private var headerSection: some View {
        VStack(spacing: 8) {
            Text(coin.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            
            Text("\(coin.symbol.uppercased()) • Rank #\(coin.rank)")
                .font(.headline)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }

    private func statusLabel(title: String, value: String, color: Color) -> some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
            Text(value)
                .fontWeight(.semibold)
                .foregroundColor(color)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }

    private func infoRow(title: String, value: String) -> some View {
        VStack {
            HStack {
                Text(title)
                    .fontWeight(.semibold)
                Spacer()
                Text(value)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 4)
            Divider()
        }
    }
    
    private func formattedDate(_ isoDate: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: isoDate) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            return displayFormatter.string(from: date)
        }
        return isoDate
    }
}


#Preview {
    CoinDetailView(coin: .default)
}


