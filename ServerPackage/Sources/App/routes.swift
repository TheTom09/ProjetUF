//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import Fluent

/// Register your application's routes here.
public func routes(_ router: Router) throws {
  router.get("hello") { req in
    return "Hello, world."
  }
}
