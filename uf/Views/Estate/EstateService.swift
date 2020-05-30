//
//  EstateService.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Alamofire
import Model
import Combine

protocol EstateService {
  func estates() -> ServerResponse<[Estate]>
  func save(estate: Estate) -> ServerResponseEmpty
  func delete(estate: Estate) -> ServerResponseEmpty
}

class EstateServiceServer: EstateService {
  func estates() -> ServerResponse<[Estate]> {
    return AF.request(ServerConfig.api + "/estates",
               method: .get,
               parameters: NoParameters,
               encoder: ServerEncoder)
      .serverResponse()
  }
  
  func save(estate: Estate) -> ServerResponseEmpty {
    return AF.request(ServerConfig.api + "/estate",
             method: .post,
             parameters: estate,
             encoder: ServerEncoder)
    .serverResponseEmpty()
  }
  
  func delete(estate: Estate) -> ServerResponseEmpty {
    return AF.request(ServerConfig.api + "/estate/\(estate.id!)",
             method: .delete,
             parameters: NoParameters,
             encoder: ServerEncoder)
    .serverResponseEmpty()
  }
}

class EstateServiceExampleSuccess: EstateService {
  func estates() -> ServerResponse<[Estate]> {
    Just(.success(.estateListExample))
      .eraseToAnyPublisher()
  }
  
  func save(estate: Estate) -> ServerResponseEmpty {
    Just(.success(()))
    .eraseToAnyPublisher()
  }
  
  func delete(estate: Estate) -> ServerResponseEmpty {
    Just(.success(()))
    .eraseToAnyPublisher()
  }
}

class EstateServiceExampleError: EstateService {
  func estates() -> ServerResponse<[Estate]> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
  
  func save(estate: Estate) -> ServerResponseEmpty {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
  
  func delete(estate: Estate) -> ServerResponseEmpty {
    Just(.failure(ServerError.error))
    .eraseToAnyPublisher()
  }
}
