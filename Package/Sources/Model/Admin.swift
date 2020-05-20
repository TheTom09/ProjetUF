//
//  Admin.swift
//  
//
//  Created by Thomas Leydet on 18/05/2020.
//

import Foundation

/// Représente l'administrateur et ses propriétés
public struct Admin: Codable {
  /// Id de l'admministrateur
  public var id: Int?
  
  public init(id: Int?) {
    self.id = id
  }
}
