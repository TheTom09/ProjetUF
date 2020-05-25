//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import FluentSQLite
import Model

extension Agency: Model, Content, Migration {
  public typealias Database = SQLiteDatabase
  public typealias ID = Int

  public static var idKey: IDKey {
    \.id
  }
  
  public var estate: Children<Agency, Estate> {
    children(\.agencyId)
  }
  
  public var agents: Children<Agency, User> {
    children(\.agencyId)
  }
}
