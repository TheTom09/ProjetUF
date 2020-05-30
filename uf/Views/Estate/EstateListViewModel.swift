//
//  EstateListViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Model
import Combine

class EstateListViewModel: ObservableObject {
var estates = [Estate]() {
  didSet { self.objectWillChange.send() }
}
  
  let service: EstateService
  var currentRequest: AnyCancellable?
  let currentUser: User
  
  init(currentUser: User, service: EstateService = EstateServiceServer()) {
    self.currentUser = currentUser
    self.service = service
  }
  
  func newEstate() -> Estate {
    var estate = Estate.empty
    if self.currentUser.type == .agent {
      estate.agencyId = self.currentUser.agencyId!
    }
    return estate
  }
  
  func getEstates() {
    self.currentRequest = self.service.estates().sink { result in
      switch result {
      case let .success(estates):
        if self.currentUser.type == .admin {
          self.estates = estates
        } else {
          self.estates = estates.filter { estate in
            self.currentUser.agencyId == estate.agencyId
          }
        }
      case .failure:
        break
      }
    }
  }
  
  func deleteEstate(indexes: IndexSet) {
    self.currentRequest = self.service.delete(estate: self.estates[indexes.first!]).sink { result in
      switch result {
      case .success:
        self.getEstates()
      case .failure:
        break
      }
    }
  }
}
