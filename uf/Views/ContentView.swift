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
import Model

struct ContentView: View {
  @State var user: User?
  
  var body: some View {
    NavigationView {
      if self.user == nil {
        LoginView(viewModel: LoginViewModel(onSuccess: { user in
          self.user = user
        }, onSignOut: {
          self.user = nil
        }))
      } else if self.user?.type == .admin {
        AdminHomeView(viewModel: AdminHomeViewModel(user: self.user!))
      } else if self.user?.type == .agent {
        AgentHomeView(viewModel: AgentHomeViewModel(user: self.user!))
      } else {
        EmptyView()
      }
    }.navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
