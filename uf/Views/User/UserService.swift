//
//  UserService.swift
//  uf
//
//  Created by Thomas Leydet on 27/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Alamofire
import Model
import Combine

protocol UserService {
  func users() -> ServerResponse<[User]>
  func clients(agencyId: Int) -> ServerResponse<[User]>
  func save(user: User) -> ServerResponse<User>
  func create(user: User) -> ServerResponse<User>
  func delete(user: User) -> ServerResponseEmpty
}

class UserServiceServer: UserService {
  func clients(agencyId: Int) -> ServerResponse<[User]> {
        return AF.request(ServerConfig.api + "/agency/\(agencyId)/clients",
               method: .get,
               parameters: NoParameters,
               encoder: ServerEncoder)
      .serverResponse()
  }
  
  func users() -> ServerResponse<[User]> {
    return AF.request(ServerConfig.api + "/users",
               method: .get,
               parameters: NoParameters,
               encoder: ServerEncoder)
      .serverResponse()
  }
  
  func save(user: User) -> ServerResponse<User> {
    return AF.request(ServerConfig.api + "/user",
                      method: .post,
                      parameters: user,
                      encoder: ServerEncoder)
      .serverResponse()
  }
  
  func create(user: User) -> ServerResponse<User> {
    return AF.request(ServerConfig.api + "/signUp",
                      method: .post,
                      parameters: user,
                      encoder: ServerEncoder)
      .serverResponse()
  }
  
  func delete(user: User) -> ServerResponseEmpty {
    return AF.request(ServerConfig.api + "/user/\(user.id!)",
                    method: .delete,
                    parameters: NoParameters,
                    encoder: ServerEncoder)
    .serverResponseEmpty()
  }
}

class UserServiceExampleSuccess: UserService {
  func clients(agencyId: Int) -> ServerResponse<[User]> {
     Just(.success(.userListExample))
         .eraseToAnyPublisher()
  }
  
  func users() -> ServerResponse<[User]> {
    Just(.success(.userListExample))
      .eraseToAnyPublisher()
  }
  
  func create(user: User) -> ServerResponse<User> {
    Just(.success(.adminExample))
    .eraseToAnyPublisher()
  }
  
  func save(user: User) -> ServerResponse<User> {
    Just(.success(.adminExample))
    .eraseToAnyPublisher()
  }
  
  func delete(user: User) -> ServerResponseEmpty {
    Just(.success(()))
    .eraseToAnyPublisher()
  }
}

class UserServiceExampleError: UserService {
  func clients(agencyId: Int) -> ServerResponse<[User]> {
    Just(.failure(ServerError.error))
    .eraseToAnyPublisher()
  }
  
  func users() -> ServerResponse<[User]> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
  
  func create(user: User) -> ServerResponse<User> {
    Just(.failure(ServerError.error))
    .eraseToAnyPublisher()
  }
  
  func save(user: User) -> ServerResponse<User> {
    Just(.failure(ServerError.error))
    .eraseToAnyPublisher()
  }
  
  func delete(user: User) -> ServerResponseEmpty {
    Just(.failure(ServerError.error))
    .eraseToAnyPublisher()
  }
}
