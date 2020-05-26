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
}

class AgencyServiceServer: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    return AF.request(ServerConfig.api + "/agencies",
               method: .get,
               parameters: NoParameters,
               encoder: JSONParameterEncoder.default)
      .serverResponse()
  }
}

class AgencyServiceExampleSuccess: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    Just(.success(.agencyListExample))
      .eraseToAnyPublisher()
  }
}

class AgencyServiceExampleError: AgencyService {
  func agencies() -> ServerResponse<[Agency]> {
    Just(.failure(ServerError.error))
      .eraseToAnyPublisher()
  }
}
