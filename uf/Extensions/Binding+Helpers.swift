//
//  Binding+Helpers.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

extension Binding {
  static func keyPath<T>(_ keyPath: ReferenceWritableKeyPath<T, Value>, on object: T) -> Self {
    Binding(get: {
      object[keyPath: keyPath]
    }, set: {
      object[keyPath: keyPath] = $0
    })
  }
}
