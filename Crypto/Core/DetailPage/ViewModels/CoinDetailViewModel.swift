//
//  CoinDetailViewModel.swift
//  Crypto
//
//  Created by Sajan Lawrence on 27/09/25.
//

import Foundation

@Observable
class CoinDetailViewModel{
    var coinDetails: CoinDetail?
    var isLoading: Bool = false
    var errorMessage: String?
    let dataService = DataService()
    
    func getCoinDetails(for coin: Coin){
        dataService.downloadData(from: "https://api.coinpaprika.com/v1/coins/\(coin.id)", as: CoinDetail.self) { [weak self] result in
            switch result {
            case .success(let data):
                self?.coinDetails = data
                print(data)
            case .failure(let error):
                print("API Error - \(error.localizedDescription)")
            }
        }
    }
}
