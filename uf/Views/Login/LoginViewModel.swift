//
//  LoginViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model
import Combine

class LoginViewModel: ObservableObject {
  let title = "Connexion"
  let emailPlaceholder = "Email"
  let passwordPlaceholder = "Mot de passe"
  let actionTitle = "Connexion"
  
  let errorMessage = "L'email ou le mot de passe est invalide."

  let service: LoginService
  var onSuccess: (User) -> Void
  let onSignOut: () -> Void
  
  var currentRequest: AnyCancellable?

  var email = "" {
    didSet { self.objectWillChange.send() }
  }
  var password = "" {
    didSet { self.objectWillChange.send() }
  }
  var error = false {
    didSet { self.objectWillChange.send() }
  }
  
  init(service: LoginService = LoginServiceServer(), onSuccess: @escaping (User) -> Void, onSignOut: @escaping () -> Void) {
    self.service = service
    self.onSuccess = onSuccess
    self.onSignOut = onSignOut
  }
  
  func login() {
    self.currentRequest = self.service.login(email: self.email, password: self.password).sink { result in
      switch result {
      case let .success(user):
        self.error = false
        self.onSuccess(user)
      case .failure:
        self.email = ""
        self.password = ""
        self.error = true
      }
    }
  }
}
