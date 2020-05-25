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
    User(id: nil, type: .admin, name: "Tommy admin", email: "", password: "", phone: "", birthdate: Date(), agencyId: nil)
  }
  
  static var agentExample: User {
    User(id: nil, type: .agent, name: "Tommy agent", email: "", password: "", phone: "", birthdate: Date(), agencyId: 1)
  }
}
