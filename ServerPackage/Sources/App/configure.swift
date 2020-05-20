//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import MySQL

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
  /// Register providers first
  try services.register(MySQLProvider())
  
  /// Register routes to the router
   let router = EngineRouter.default()
   try routes(router)
   services.register(router, as: Router.self)
}
