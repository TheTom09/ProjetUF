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
  
  func signUp(req: Request) throws -> Future<User> {
    try req.content.decode(User.self).flatMap { user in
      User.query(on: req).filter(\.email, .equal, user.email)
        .first()
        .flatMap { existingUser -> Future<User> in
          guard existingUser == nil else { throw Abort(.conflict) }
          var user = user
          user.password = try BCryptDigest().hash(user.password)
          return user.save(on: req)
      }
    }
  }
  
  func postUser(req: Request) throws -> Future<User> {
    try req.content.decode(User.self).flatMap { user in
      guard let id = user.id else { throw Abort(.notFound) }
      return User.find(id, on: req)
        .unwrap(or: Abort(.notFound))
        .flatMap { _ in
          user.save(on: req)
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
  
  func getClientsFromAgency(req: Request) throws -> Future<[User]> {
    Agency.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { agency in
        try agency.clients.query(on: req).all().map { clients in
          Set(clients).sorted()
        }
    }
  }
  
  func login(req: Request) throws -> Future<User> {
    try req.content.decode(LoginRequest.self).flatMap { loginRequest in
      User.authenticate(username: loginRequest.email,
                        password: loginRequest.password,
                        using: BCryptDigest(),
                        on: req)
        .unwrap(or: Abort(.badRequest))
    }
  }
  
  func loginWebView(req: Request) throws -> Future<View> {
    if req.http.method == .POST {
      return try self.login(req: req).flatMap { user in
        return try req.view().render("login", ["userName": user.name])
      }.catchFlatMap { _ in
        return try req.view().render("login", ["error": true])
      }
    } else {
      return try req.view().render("login")
    }
  }
}
