//
//  File.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import FluentMySQL
import Model

extension Agent: Model {
  public typealias Database = MySQLDatabase
  public typealias ID = Int
  
  public static var idKey: IDKey {
    \.id
  }
}
