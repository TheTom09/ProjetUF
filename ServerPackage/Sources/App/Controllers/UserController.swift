//
//  UserController.swift
//  
//
//  Created by Thomas Leydet on 26/05/2020.
//

import Foundation
import Vapor
import Model
import Crypto

struct UserController {
  
  func getUsers(req: Request) -> Future<[User]> {
    User.query(on: req).all()
  }
  
  func postUser(req: Request) throws -> Future<HTTPResponseStatus> {
    try req.content.decode(User.self).flatMap { user in
      User.query(on: req).filter(\.email, .equal, user.email)
        .first()
        .flatMap { existingUser -> Future<HTTPResponseStatus> in
          guard existingUser == nil else { throw Abort(.conflict) }
          var user = user
          user.password = try BCryptDigest().hash(user.password)
          return user.save(on: req).transform(to: HTTPStatus.ok)
      }
    }
  }
  
  func deleteUser(req: Request) throws -> Future<HTTPResponseStatus> {
    User.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { user in
        return user.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
  
  func getAgentsFromAgency(req: Request) throws -> Future<[User]> {
    User.query(on: req)
      .filter(\.agencyId, .equal, try req.parameters.next(Int.self))
      .all()
  }
}
