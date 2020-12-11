//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
protocol CoinManagerDelegate{
    func didUpdatePrice(price: String, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate : CoinManagerDelegate?
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for selectedCurrency: String){
        let url = "https://rest.coinapi.io/v1/exchangerate/BTC/\(selectedCurrency)?apikey=03E79123-42C4-4734-A99A-0CDC4A93938A"
        performUrl(url: url, currency: selectedCurrency)
    }
    
    func performUrl(url:String, currency: String){
        let url = URL(string: url)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!, completionHandler:{(data, response, error) in
            if error != nil{
                print(error)
                return
            }
            if let safeData = data{
                let rate = self.JSONParsing(safeData)
                self.delegate?.didUpdatePrice(price: rate, currency: currency)
            }
        })
        task.resume()
    }
    
        func JSONParsing(_ coinData: Data) -> String{
            let decoder = JSONDecoder()
            do{
                let decodedData = try decoder.decode(CoinData.self, from: coinData)
                print(String(decodedData.rateRounded))
                return String(decodedData.rateRounded)
            }catch{
                print("error is: \(error)")
                return "0"
            }
            //decode coindata to coinmodel
           
        }
}
