//
//  Estate.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente une propriété et ses informations
public struct Estate {
  /// Id du bien
  public let id: Int
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
  public let localisation: String
  /// Liste des dépendances (garage, jardin etc...)
  public let outbuilding: [EstateOutbuilding]
  /// Prix minimum du bien
  public let minimumPrice: Int
  /// Prix maximum du bien
  public let maximumPrice: Int
  /// Prix du bien
  public let price: Int
  /// Frais d'agence
  public let fees: Int
}

/// Représente les types de la propriété
public enum EstateType {
  case apartment
  case house
}
/// Représente les types des dépendances
public enum EstateOutbuilding {
  case garden
  case garage
  case basement
}
