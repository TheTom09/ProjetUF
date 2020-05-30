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
/// Represente une response du serveur, peut etre vide un objet soit une erreur.
typealias ServerResponseEmpty = AnyPublisher<Result<Void, Error>, Never>
/// Represente l'encodeur par défaut pour le serveur.
let ServerEncoder = JSONParameterEncoder(encoder: {
  let encoder = JSONEncoder()
  encoder.dateEncodingStrategy = .iso8601
  return encoder
}())

private let serverQueue = DispatchQueue(label: "request", qos: .default)

extension DataRequest {
  /// Envoi une requete au serveur et recois une reponse d'un certain type.
  /// La reponse peut soit etre un objet, soit une erreur
  func serverResponse<T: Decodable>(_ type: T.Type = T.self) -> ServerResponse<T> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601
    return self.publishDecodable(type: type, queue: serverQueue, decoder: decoder)
      .tryMap { try $0.result.get() }
      .map { .success($0) }
      .catch { Just(.failure($0)) }
      .eraseToAnyPublisher()
  }
  
  /// Envoi une requete au serveur et recois une reponse vide.
  /// La reponse peut soit etre vide, soit une erreur
  func serverResponseEmpty() -> ServerResponseEmpty {
    return self.publishUnserialized(queue: serverQueue)
      .tryMap { try $0.result.map { _ in }.get() }
      .map { .success($0) }
      .catch { Just(.failure($0)) }
      .eraseToAnyPublisher()
  }
}

let NoParameters = nil as [String:String]?

enum ServerError: Error {
  case error
}
