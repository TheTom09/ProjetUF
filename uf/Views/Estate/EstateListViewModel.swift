//
//  EstateListViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Model

class EstateListViewModel {
  let list = [
    Estate(id: 0, agencyId: 0, clientId: 0, type: .apartment, surface: 10, rooms: 1, floor: 1, location: "Paris", outbuildings: [.basement], minimumPrice: 100, maximumPrice: 200, price: 150, fees: 100),
    Estate(id: 1, agencyId: 1, clientId: 1, type: .house, surface: 100, rooms: 4, floor: 1, location: "Marseille", outbuildings: [.garden,.garage], minimumPrice: 100000, maximumPrice: 300000, price: 150000, fees: 1000),
    Estate(id: 2, agencyId: 2, clientId: 2, type: .apartment, surface: 20, rooms: 2, floor: 2, location: "Lyon", outbuildings: [.garage], minimumPrice: 400, maximumPrice: 900, price: 650, fees: 650),
  ]
  
}
