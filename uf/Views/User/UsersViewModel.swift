//
//  UsersViewModel.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Model
import Combine

class UsersViewModel: ObservableObject {
var users = [User]() {
  didSet { self.objectWillChange.send() }
}
  
  let service: UserService
  var currentRequest: AnyCancellable?
  let currentUser: User
  
  var isEditable: Bool {
    self.currentUser.type == .admin
  }
  
  init(currentUser: User, service: UserService = UserServiceServer()) {
    self.currentUser = currentUser
    self.service = service
  }
  
  func getUsers() {
    let serviceResponse: ServerResponse<[User]>
    if self.currentUser.type == .admin {
      serviceResponse = self.service.users()
    } else {
      serviceResponse = self.service.clients(agencyId: self.currentUser.agencyId!)
    }
    self.currentRequest = serviceResponse.sink { result in
      switch result {
      case let .success(users):
        self.users = users
      case .failure:
        break
      }
    }
  }
  
  func delete(indexes: IndexSet) {    
    self.currentRequest = self.service.delete(user: self.users[indexes.first!]).sink(receiveValue: { result in
      switch result {
      case .success:
        self.getUsers()
      case .failure:
        break
      }
    })
  }
}
