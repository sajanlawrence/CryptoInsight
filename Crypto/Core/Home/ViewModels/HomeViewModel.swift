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
    var filteredCoins: [Coin] = []
    var globalMarket: GlobalMarket? = nil
    let dataService = DataService()
    var searchTxtField = ""{
        didSet{
            filterCoins()
        }
    }
    init(){
        getMarketOverview()
        getCoins()
        
    }
    
    func filterCoins(){
        if searchTxtField.isEmpty{
            filteredCoins = coins
        }else{
            let lowercasedSearch = searchTxtField.lowercased()
            filteredCoins = coins.filter { coin in
                coin.name.lowercased().contains(lowercasedSearch) || coin.symbol.lowercased().contains(lowercasedSearch)
            }
        }
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
                self?.initializeFilteredCoins()
            case .failure(let error):
                print("API Error:", error.localizedDescription)
            }
        }
    }
    
    func initializeFilteredCoins(){
        filteredCoins = coins
    }
    
    func sortBasedOnRank(ascending: Bool){
        filteredCoins.sort(by: { ascending ? ($0.rank < $1.rank) : ($0.rank > $1.rank) })
    }
}
