//
//  AgencyViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import Combine

class AgencyViewModel: ObservableObject {
  let service: AgencyService
  let currentUser: User
  var currentRequest: AnyCancellable?
  var onSave: (() -> Void)?
  
  var agency: Agency {
    didSet { self.objectWillChange.send() }
  }
  
  var isEditable: Bool {
    self.currentUser.type == .admin
  }
  
  var isValid: Bool {
    // Invalid si location ou name ou telephone vide
    if self.agency.location.isEmpty || self.agency.name.isEmpty || self.agency.phone.isEmpty {
      return false
    }
    return true
  }
  
  init(agency: Agency, service: AgencyService = AgencyServiceServer(), currentUser: User, onSave: (() -> Void)? = nil) {
    self.agency = agency
    self.currentUser = currentUser
    self.service = service
    self.onSave = onSave
  }
  
  func save() {
    self.currentRequest = self.service.save(agency: self.agency).sink(receiveValue: { result in
      switch result {
      case .success:
        self.onSave?()
      case .failure:
        break
      }
    })
  }
}
