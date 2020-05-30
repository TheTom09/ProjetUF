//
//  AgencyService.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import UIKit
import Alamofire
import Model
import Combine

protocol AgencyService {
  func agencies() -> ServerResponse<[Agency]>
  func save(agency: Agency) -> ServerResponse<Agency>
  func delete(agency: Agency) -> ServerResponseEmpty
}

class AgencyServiceServer: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    return AF.request(ServerConfig.api + "/agencies",
               method: .get,
               parameters: NoParameters,
               encoder: ServerEncoder)
      .serverResponse()
  }
  
  func save(agency: Agency) -> ServerResponse<Agency> {
    return AF.request(ServerConfig.api + "/agency",
               method: .post,
               parameters: agency,
               encoder: ServerEncoder)
      .serverResponse()
  }
  
  func delete(agency: Agency) -> ServerResponseEmpty {
    return AF.request(ServerConfig.api + "/agency/\(agency.id!)",
             method: .delete,
             parameters: NoParameters,
             encoder: ServerEncoder)
    .serverResponseEmpty()
  }
}

class AgencyServiceExampleSuccess: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    Just(.success(.agencyListExample))
      .eraseToAnyPublisher()
  }
  
  func save(agency: Agency) -> ServerResponse<Agency> {
    Just(.success(.agencyExample))
      .eraseToAnyPublisher()
  }
  
  func delete(agency: Agency) -> ServerResponseEmpty {
    Just(.success(()))
      .eraseToAnyPublisher()
  }
}

class AgencyServiceExampleError: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
  
  func save(agency: Agency) -> ServerResponse<Agency> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
  
  func delete(agency: Agency) -> ServerResponseEmpty {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
}
