//
//  EstateController.swift
//  
//
//  Created by Thomas Leydet on 25/05/2020.
//

import Foundation
import Vapor
import Model

struct EstateController {
  
  func getEstates(req: Request) -> Future<[Estate]> {
    Estate.query(on: req).all()
  }
  
  func postEstate(req: Request) throws -> Future<HTTPResponseStatus> {
    try req.content.decode(Estate.self)
      .save(on: req)
      .transform(to: HTTPStatus.ok)
  }
  
  func deleteEstate(req: Request) throws -> Future<HTTPResponseStatus> {
    Estate.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { estate in
        return estate.delete(on: req)
          .transform(to: HTTPStatus.ok)
    }
  }
  func getEstatesFromAgency(req: Request) throws -> Future<[Estate]> {
    Estate.query(on: req).filter(\.agencyId, .equal, try req.parameters.next(Int.self)).all()
  }
}
