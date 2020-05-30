//
//  EstateViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import SwiftUI
import Combine

class EstateViewModel: ObservableObject {
  let service: EstateService
  let currentUser: User
  var currentRequest: AnyCancellable?
  var onSave: (() -> Void)?
  
  var estate: Estate {
    didSet { self.objectWillChange.send() }
  }
  
  var isEditable: Bool {
    return self.currentUser.type != .client
  }
  
  var isValid: Bool {
    if self.estate.agencyId == 0 || self.estate.clientId == 0 {
      return false
    }
    if self.estate.location.isEmpty {
      return false
    }
    if self.estate.maximumPrice == 0 || self.estate.minimumPrice == 0 || self.estate.price == 0 {
      return false
    }
    if self.estate.rooms == 0 || self.estate.surface == 0 {
      return false
    }
    return true
  }
  
  init(estate: Estate, currentUser: User, service: EstateService = EstateServiceServer(), onSave: (() -> Void)? = nil) {
    self.currentUser = currentUser
    self.estate = estate
    self.service = service
    self.onSave = onSave
  }
  
  func saveEstate() {
    self.currentRequest = self.service.save(estate: self.estate).sink(receiveValue: { result in
      switch result {
      case .success:
        // Afficher OK
        self.onSave?()
        break
      case .failure:
        // Gerer erreur
        break
      }
    })
  }
}
