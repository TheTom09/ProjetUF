//
//  UserType+String.swift
//  uf
//
//  Created by Thomas Leydet on 27/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model

extension UserType: CustomStringConvertible {
  public var description: String {
    switch self {
    case .admin:
      return "Administrateur"
    case .agent:
      return "Agent Immobilier"
    case .client:
      return "Client"
    }
  }
}
