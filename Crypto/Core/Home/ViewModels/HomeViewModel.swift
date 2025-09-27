//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation
import Combine

@Observable
class HomeViewModel{
    var coins: [Coin] = []
    var globalMarket: GlobalMarket? = nil
    let dataService = DataService()
    init(){
        getMarketOverview()
        getCoins()
    }
    
    func getMarketOverview(){
        dataService.downloadData(from: "https://api.coinpaprika.com/v1/global", as: GlobalMarket.self) { [weak self] result in
            switch result {
            case .success(let value):
                self?.globalMarket = value
            case .failure(let error):
                print("API Error:", error.localizedDescription)
            }
        }
    }
    func getCoins(){
        dataService.downloadData(from: "https://api.coinpaprika.com/v1/coins", as: [Coin].self) { [weak self] result in
            switch result {
            case .success(let items):
                self?.coins = Array(items.prefix(1000))
            case .failure(let error):
                print("API Error:", error.localizedDescription)
            }
        }
    }
}
