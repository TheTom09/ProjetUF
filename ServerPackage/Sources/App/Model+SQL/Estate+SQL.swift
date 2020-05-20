//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import FluentMySQL
import Model

extension Estate: Model {
  public typealias Database = MySQLDatabase
  public typealias ID = Int
  
  public static var idKey: IDKey {
    \.id
  }
  
  public var client: Parent<Estate, Client> {
    parent(\.agencyId)
  }
  
  public var agency: Parent<Estate, Agency> {
    parent(\.agencyId)
  }
}
