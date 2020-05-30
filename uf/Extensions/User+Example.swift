//
//  User+Example.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Foundation
import Model

extension User {
  static var adminExample: User {
    User(id: 0, type: .admin, name: "Amine", email: "amine@admin.min", password: "amine", phone: "06 06 06 06 06", birthdate: Date(), agencyId: 0)
  }
  
  static var agentExample: User {
    User(id: 100, type: .agent, name: "Arnaud", email: "arnaud@gmail.fr", password: "arnaud", phone: "00 00 00 00 00", birthdate: Date(), agencyId: 0)
  }
  
  static var clientExample: User {
    User(id: 200, type: .client, name: "Tommy", email: "tommy@gamil.fr", password: "tommy", phone: "22 22 22 22 22", birthdate: Date(), agencyId: 0)
  }
  
  static var empty: User {
    User(id: nil, type: .client, name: "", email: "", password: "", phone: "", birthdate: Date(), agencyId: nil)
  }
}

extension Array where Element == User {
  static var userListExample: [User] {
    [.adminExample, .agentExample, .clientExample]
  }
}
