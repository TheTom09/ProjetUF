//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import Model
import SQLite

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  router.get("agencies") { (req: Request) in
    Agency.query(on: req).all()
  }
  router.post("agency") { (req: Request) in
    try req.content.decode(Agency.self)
      .save(on: req)
      .transform(to: HTTPStatus.ok)
  }
  router.delete("agency", Int.parameter) { (req: Request) -> Future<HTTPResponseStatus> in
    Agency.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { client in
        return client.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
  router.get("clients") { (req: Request) in
    ClientModel.query(on: req).all()
  }
  router.post("client") { (req: Request) in
    try req.content.decode(ClientModel.self)
      .save(on: req)
      .transform(to: HTTPStatus.ok)
  }
  router.delete("client", Int.parameter) { (req: Request) -> Future<HTTPResponseStatus> in
    ClientModel.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { client in
        return client.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
  router.get("estates") { (req: Request) in
    Estate.query(on: req).all()
  }
  router.post("estate") { (req: Request) in
    try req.content.decode(Estate.self)
      .save(on: req)
      .transform(to: HTTPStatus.ok)
  }
  router.delete("estate", Int.parameter) { (req: Request) -> Future<HTTPResponseStatus> in
    Estate.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { estate in
        return estate.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
  router.get("agency", Int.parameter, "estates") { (req: Request) in
    Estate.query(on: req).filter(\.agencyId, .equal, try req.parameters.next(Int.self)).all()
  }
  router.get("agents") { (req: Request) in
    Agent.query(on: req).all()
  }
  router.post("agent") { (req: Request) in
    try req.content.decode(Agent.self)
      .save(on: req)
      .transform(to: HTTPStatus.ok)
  }
  router.delete("agent", Int.parameter) { (req: Request) -> Future<HTTPResponseStatus> in
    Agent.find(try req.parameters.next(Int.self), on: req)
      .unwrap(or: Abort(.notFound))
      .flatMap { estate in
        return estate.delete(on: req).transform(to: HTTPStatus.ok)
    }
  }
}
