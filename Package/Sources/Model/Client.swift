//
//  Client.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente le client et ses propriétés
public struct Client: Codable {
  /// Id du client
  public var id: Int?
  /// Nom du client
  public let name: String
  /// Mail du client
  public let email: String
  /// Numéro du client
  public let phone: String
  /// Date de naissance du client
  public let birthdate: Date
  
  public init(id: Int?, name: String, email: String, phone: String, birthdate: Date) {
    self.id = id
    self.name = name
    self.email = email
    self.phone = phone
    self.birthdate = birthdate
  }
}


