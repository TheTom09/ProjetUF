//
//  LoginViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model

class LoginViewModel: ObservableObject {
  let agency = Agency(id: 0, name: "Tom", location: "Aix en privence", phone: "060606060")
  
  
  let title = "Connexion"
  let emailPlaceholder = "Email"
  let passwordPlaceholder = "Mot de passe"
  let actionTitle = "Connexion"
  
  let goodEmail = "aaa"
  let goodPassword = "bbb"
  
  let errorMessage = "L'email ou le mot de passe est invalide."
  
  var onSuccess: () -> Void

  var email = "" {
    didSet { self.objectWillChange.send() }
  }
  var password = "" {
    didSet { self.objectWillChange.send() }
  }
  var error = false {
    didSet { self.objectWillChange.send() }
  }
  
  init(onSuccess: @escaping () -> Void) {
    self.onSuccess = onSuccess
  }
  
  func login() {
    if self.email == self.goodEmail && self.password == self.goodPassword {
      self.error = false
      self.onSuccess()
    } else {
      self.email = ""
      self.password = ""
      self.error = true
    }
  }
}
