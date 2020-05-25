//
//  User.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente un utilisateur et ses propriétés
public struct User: Codable {
  /// Id de l'utilisateur
  public var id: Int?
  /// Type de l'utilisateur
  public let type: UserType
  /// Nom de l'utilisateur
  public let name: String
  /// Mail de l'utilisateur
  public var email: String
  /// Mot de passe encodé de l'utilisateur
  public var password: String
  /// Numéro de l'utilisateur
  public let phone: String
  /// Date de naissance de l'utilisateur
  public let birthdate: Date
  /// Id de l'agence si l'utilisateur est un agent
  public let agencyId: Int?
  
  public init(id: Int?,
              type: UserType,
              name: String,
              email: String,
              password: String,
              phone: String,
              birthdate: Date,
              agencyId: Int?) {
    self.id = id
    self.type = type
    self.name = name
    self.email = email
    self.password = password
    self.phone = phone
    self.birthdate = birthdate
    self.agencyId = agencyId
  }
}

/// Représente un type d'utilisateur
public enum UserType: Int, Codable {
  case admin = 0
  case agent = 1
  case client = 2
}
