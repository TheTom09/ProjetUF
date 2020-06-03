//
//  File.swift
//
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Model
import Vapor
import SQLite
import FluentSQLite
import Authentication
import Leaf

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {
  /// Register providers first
  try services.register(FluentSQLiteProvider())
  
  let sqlite = try SQLiteDatabase(storage: .file(path: "db.sqlite"))

  /// Register the configured SQLite database to the database config.
  var databases = DatabasesConfig()
  databases.add(database: sqlite, as: .sqlite)
  services.register(databases)
  
  // Configure the authentication provider
  try services.register(AuthenticationProvider())
  try services.register(LeafProvider())
  config.prefer(LeafRenderer.self, for: ViewRenderer.self)
  
  /// Register routes to the router
   let router = EngineRouter.default()
   try routes(router)
   services.register(router, as: Router.self)
  
  var middlewareConfig = MiddlewareConfig()
  middlewareConfig.use(FileMiddleware.self)
  services.register(middlewareConfig)
  
  var migration = MigrationConfig()
  migration.add(model: Agency.self, database: .sqlite)
  migration.add(model: User.self, database: .sqlite)
  migration.add(model: Estate.self, database: .sqlite)
  services.register(migration)
}

