//
//  EstateType+String.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model

extension EstateType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .apartment:
      return "Appartement"
    case .house:
      return "Maison"
    }
  }
}

extension EstateOutbuilding: CustomStringConvertible {
  public var description: String {
    switch self {
    case .garden:
      return "Jardin"
    case .garage:
      return "Garage"
    case .basement:
      return "Sous-sol"
    }
  }
}

extension EstateStatus: CustomStringConvertible {
  public var description: String {
    switch self {
    case .forRent:
      return "A louer"
    case .forSale:
      return "A vendre"
    case .rented:
      return "Loué"
    case .sold:
      return "Vendu"
    }
  }
}
