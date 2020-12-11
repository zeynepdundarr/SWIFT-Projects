//
//  coinData.swift
//  ByteCoin
//
//  Created by Zeynep on 8.05.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Decodable{
    let rate: Double
    var rateRounded: String{ return String(format: "%.3f", rate)}

}
