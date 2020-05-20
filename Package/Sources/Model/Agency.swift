//
//  Agency.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente une agence et ses propriétés
public struct Agency: Codable, Identifiable {
  /// Id de l'agence
  public var id: Int?
  /// Nom de l'agence
  public let name: String
  /// Localisation de l'agence
  public let location: String
  /// Numéro de l'agence
  public let phone: String
  
  public init(id: Int?, name: String, location: String, phone: String) {
    self.id = id
    self.name = name
    self.location = location
    self.phone = phone
  }
}

