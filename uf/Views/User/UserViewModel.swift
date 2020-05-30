//
//  UserViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 27/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import Combine

class UserViewModel: ObservableObject {
  let service: UserService
  let currentUser: User
  var user: User {
    didSet { self.objectWillChange.send() }
  }
  
  var onSave: (() -> Void)?
  var currentRequest: AnyCancellable?
  
  var isEditable: Bool {
    return self.currentUser.type == .admin
  }
  
  var isValid: Bool {
    // Desactive le bouton enregistrer si l'utilisateur est agent et qu'il a un agencyId vide
    if self.user.type == .agent {
      if self.user.agencyId == nil {
        return false
      }
    }
    // Desactive le bouton enregistrer si le mot de passe ou l'email ou le nom est vide
    if self.user.password.isEmpty || self.user.email.isEmpty || self.user.name.isEmpty {
      return false
    }
    return true
  }
  
  init(user: User, currentUser: User, service: UserService = UserServiceServer(), onSave: (() -> Void)? = nil) {
    self.user = user
    self.service = service
    self.onSave = onSave
    self.currentUser = currentUser
  }
  
  func save() {
    let request: ServerResponse<User>
    if self.user.id != nil {
      request = self.service.save(user: self.user)
    } else {
      request = self.service.create(user: self.user)
    }
    self.currentRequest = request.sink(receiveValue: { result in
      switch result {
      case .success:
        self.onSave?()
      case .failure:
        break
      }
    })
  }
}
