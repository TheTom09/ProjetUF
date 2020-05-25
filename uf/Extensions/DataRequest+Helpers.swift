//
//  JSONDecoder+Helpers.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Foundation
import Alamofire
import Combine

typealias ServerResponse<T> = AnyPublisher<Result<T, Error>, Never>

extension DataRequest {
  func serverResponse<T: Decodable>(_ type: T.Type = T.self) -> ServerResponse<T> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return self.publishDecodable(type: type, decoder: decoder)
      .tryMap { try $0.result.get() }
      .map { .success($0) }
      .catch { Just(.failure($0)) }
      .eraseToAnyPublisher()
  }
}

enum ServerError: Error {
  case error
}
