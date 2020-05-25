//
//  AgentHomeViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import Combine

class AgentHomeViewModel: ObservableObject {
  let user: User
  
  init(user: User) {
    self.user = user
  }
}
