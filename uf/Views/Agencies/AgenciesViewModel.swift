//
//  AgenciesViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 19/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model
import Combine

class AgenciesViewModel: ObservableObject {
  var agencies = [Agency]() {
    didSet { self.objectWillChange.send() }
  }
  
  let service: AgencyService
  let currentUser: User
  var currentRequest: AnyCancellable?
  
  var isEditable: Bool {
    self.currentUser.type == .admin
  }
  
  init(service: AgencyService = AgencyServiceServer(), currentUser: User) {
    self.service = service
    self.currentUser = currentUser
  }
  
  func getAgencies() {
    self.currentRequest = self.service.agencies().sink { result in
      switch result {
      case let .success(agencies):
        self.agencies = agencies
      case .failure:
        break
      }
    }
  }
  
  func delete(indexes: IndexSet) {
    self.currentRequest = self.service.delete(agency: self.agencies[indexes.first!]).sink(receiveValue: { result in
      switch result {
      case .success:
        self.getAgencies()
      case .failure:
        break
      }
    })
  }
}
