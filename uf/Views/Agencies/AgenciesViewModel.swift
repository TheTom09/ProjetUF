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
  var currentRequest: AnyCancellable?
  
  
  init(service: AgencyService = AgencyServiceServer()) {
    self.service = service
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
}
