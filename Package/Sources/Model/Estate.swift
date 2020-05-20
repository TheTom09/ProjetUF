//
//  Estate.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente une propriété et ses informations
public struct Estate: Codable, Identifiable {
  /// Id du bien
  public var id: Int?
  /// Id de l'agence du bien
  public let agencyId: Int
  /// Id du client du bien
  public let clientId: Int
  /// Type de la propriété (appart ou maison)
  public let type: EstateType
  /// Surface du bien (50m2)
  public let surface: Int
  /// Nombre de pièces (T4)
  public let rooms: Int
  /// Niveau d'étage du bien (3ème étage)
  public let floor: Int
  /// Lieu du bien (Aix-en-Provence)
  public let location: String
  /// Liste des dépendances (garage, jardin etc...)
  public let outbuildings: [EstateOutbuilding]
  /// Prix minimum du bien
  public let minimumPrice: Int
  /// Prix maximum du bien
  public let maximumPrice: Int
  /// Prix du bien
  public let price: Int
  /// Frais d'agence
  public let fees: Int
  
  public init(id: Int?,
              agencyId: Int,
              clientId: Int,
              type: EstateType,
              surface: Int,
              rooms: Int,
              floor: Int,
              location: String,
              outbuildings: [EstateOutbuilding],
              minimumPrice: Int,
              maximumPrice: Int,
              price: Int,
              fees: Int) {
    self.id = id
    self.agencyId = agencyId
    self.clientId = clientId
    self.type = type
    self.surface = surface
    self.rooms = rooms
    self.floor = floor
    self.location = location
    self.outbuildings = outbuildings
    self.minimumPrice = minimumPrice
    self.maximumPrice = maximumPrice
    self.price = price
    self.fees = fees
  }
}

/// Représente les types de la propriété
public enum EstateType: String, Codable {
  case apartment
  case house
}
/// Représente les types des dépendances
public enum EstateOutbuilding: String, Codable {
  case garden
  case garage
  case basement
}

