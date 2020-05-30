//
//  LoginService.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Alamofire
import Model
import Combine

protocol LoginService {
  func login(email: String, password: String) -> ServerResponse<User>
}

class LoginServiceServer: LoginService {
  func login(email: String, password: String) -> ServerResponse<User> {
    return AF.request(ServerConfig.api + "/login",
               method: .post,
               parameters: ["email": email,
                            "password": password],
               encoder: ServerEncoder)
      .serverResponse()
  }
}

class LoginServiceExampleSuccess: LoginService {
  func login(email: String, password: String) -> ServerResponse<User> {
    Just(.success(.adminExample))
      .eraseToAnyPublisher()
  }
}

class LoginServiceExampleError: LoginService {
  func login(email: String, password: String) -> ServerResponse<User> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
}
