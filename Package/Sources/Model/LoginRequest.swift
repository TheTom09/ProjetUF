//
//  LoginRequest.swift
//  
//
//  Created by Thomas Leydet on 25/05/2020.
//

import Foundation

/// Représente les informations que nécessaire à la connexion d'un utilisateur
public struct LoginRequest: Codable {
  /// Email à vérifier
  public let email: String
  /// Mot de passe à vérifier
  public let password: String
}

