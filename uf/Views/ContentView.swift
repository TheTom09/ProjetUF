//
//  ContentView.swift
//  uf
//
//  Created by Thomas Leydet on 17/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ContentView: View {
  @State var isLogged = false
  
  var body: some View {
    NavigationView {
      if !self.isLogged {
        LoginView(viewModel: LoginViewModel(onSuccess: {
          self.isLogged = true
        }))
      } else {
        AgenciesView(viewModel: AgenciesViewModel())
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
