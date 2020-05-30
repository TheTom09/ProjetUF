//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import FluentSQLite
import Model

extension Estate: Model, Content, Migration {
  public typealias Database = SQLiteDatabase
  public typealias ID = Int
  
  public static var idKey: IDKey {
    \.id
  }
  
  public var client: Parent<Estate, User> {
    parent(\.agencyId)
  }
  
  public var agency: Parent<Estate, Agency> {
    parent(\.agencyId)
  }
}

extension Estate: Pivot {
  public typealias Left = Agency
  public typealias Right = User
  
  public static var leftIDKey: LeftIDKey {
    \.agencyId
  }
  
  public static var rightIDKey: RightIDKey {
    \.clientId
  }
}
