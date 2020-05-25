//
//  User.swift
//  
//
//  Created by Thomas Leydet on 21/05/2020.
//

import Vapor
import FluentSQLite
import Model
import Authentication

extension User: Model, Content, Migration {
  public typealias Database = SQLiteDatabase
  public typealias ID = Int
  
  public static let idKey: IDKey = \.id
}

extension User: PasswordAuthenticatable {
  public static let usernameKey: UsernameKey = \.email
  public static var passwordKey: PasswordKey = \.password
}
