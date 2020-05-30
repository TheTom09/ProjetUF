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
  public var agencyId: Int
  /// Id du client du bien
  public var clientId: Int
  /// Type de la propriété (appart ou maison)
  public var type: EstateType
  /// Surface du bien (50m2)
  public var surface: Int
  /// Nombre de pièces (T4)
  public var rooms: Int
  /// Niveau d'étage du bien (3ème étage)
  public var floor: Int
  /// Lieu du bien (Aix-en-Provence)
  public var location: String
  /// Liste des dépendances (garage, jardin etc...)
  public var outbuildings: [EstateOutbuilding]
  /// Prix minimum du bien
  public var minimumPrice: Int
  /// Prix maximum du bien
  public var maximumPrice: Int
  /// Prix du bien
  public var price: Int
  /// Frais d'agence
  public var fees: Int
  /// Status du bien
  public var status: EstateStatus
  
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
              fees: Int,
              status: EstateStatus) {
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
    self.status = status
  }
}

/// Représente les types de la propriété
public enum EstateType: Int, Codable, CaseIterable {
  case apartment = 0
  case house = 1
}
/// Représente les types des dépendances
public enum EstateOutbuilding: Int, Codable, CaseIterable {
  case garden = 0
  case garage = 1
  case basement = 2
}

/// Représente l'etat du bien
public enum EstateStatus: Int, Codable, CaseIterable {
  /// A vendre
  case forSale = 0
  /// Vendu
  case sold = 1
  /// A louer
  case forRent = 2
  /// Loué
  case rented = 3
}

