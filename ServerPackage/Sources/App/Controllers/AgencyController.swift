//
//  AgencyController.swift
//  
//
//  Created by Thomas Leydet on 25/05/2020.
//

import Foundation
import Vapor
import Model

struct AgencyController {
  
  func getAgencies(req: Request) -> Future<[Agency]> {
    Agency.query(on: req).all()
  }
  
  func postAgency(req: Request) throws -> Future<Agency> {
    try req.content.decode(Agency.self)
      .save(on: req)
  }
  
  func deleteAgency(req: Request) throws -> Future<HTTPResponseStatus> {
    Agency.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { client in
        return client.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
}
