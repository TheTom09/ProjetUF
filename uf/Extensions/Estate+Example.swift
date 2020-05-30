//
//  Estate+Example.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Foundation
import Model

extension Estate {
  static var estateExample: Estate {
    Estate(id: 0, agencyId: 0, clientId: 0, type: .house, surface: 10, rooms: 1, floor: 1, location: "Chateau-Arnoux", outbuildings: [.basement], minimumPrice: 0, maximumPrice: 100, price: 50, fees: 50, status: .forRent)
  }
  
  static var empty: Estate {
    Estate(id: nil, agencyId: 0, clientId: 0, type: .house, surface: 0, rooms: 0, floor: 0, location: "", outbuildings: [], minimumPrice: 0, maximumPrice: 0, price: 0, fees: 0, status: .forRent)
  }
}

extension Array where Element == Estate {
  static var estateListExample: [Estate] { [
    Estate(id: 0, agencyId: 0, clientId: 0, type: .apartment, surface: 10, rooms: 1, floor: 1, location: "Paris", outbuildings: [.basement], minimumPrice: 100, maximumPrice: 200, price: 150, fees: 100, status: .forRent),
    Estate(id: 1, agencyId: 1, clientId: 1, type: .house, surface: 100, rooms: 4, floor: 1, location: "Marseille", outbuildings: [.garden,.garage], minimumPrice: 100000, maximumPrice: 300000, price: 150000, fees: 1000, status: .forRent),
    Estate(id: 2, agencyId: 2, clientId: 2, type: .apartment, surface: 20, rooms: 2, floor: 2, location: "Lyon", outbuildings: [.garage], minimumPrice: 400, maximumPrice: 900, price: 650, fees: 650, status: .forRent)
    ]  }
}

