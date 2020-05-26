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

/// Represente une response du serveur, peut etre soit un objet soit une erreur.
typealias ServerResponse<T> = AnyPublisher<Result<T, Error>, Never>

extension DataRequest {
  /// Envoi une requete au serveur et recois une reponse d'un certain type.
  /// La reponse peut soit etre un objet, soit une erreur
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

let NoParameters = nil as [String:String]?

enum ServerError: Error {
  case error
}
