//
//  Agent.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente un agent et ses propriétés
public struct Agent: Codable {
  /// Id de l'agent
  public var id: Int?
  /// Id de l'agence de l'agent
  public let agencyId: Int
  /// Nom de l'agent
  public let name: String
  //// Numéro de l'agent
  public let phone: String
  
  public init(id: Int?, agencyId: Int, name: String, phone: String) {
    self.id = id
    self.agencyId = agencyId
    self.name = name
    self.phone = phone
  }
}
