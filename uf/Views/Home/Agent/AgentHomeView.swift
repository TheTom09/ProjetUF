//
//  AgentHomeView.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct AgentHomeView: View {
  @ObservedObject var viewModel: AgentHomeViewModel
  
  var body: some View {
    List {
      NavigationLink(destination: UsersView(viewModel: UsersViewModel(currentUser: self.viewModel.user)), label: {
        Text("Clients")
      })
      NavigationLink(destination: EstateListView(viewModel: EstateListViewModel(currentUser: self.viewModel.user)), label: {
        Text("Biens")
      })
    }
  }
}

struct AgentHomeView_Previews: PreviewProvider {
  static var previews: some View {
    AgentHomeView(viewModel: AgentHomeViewModel(user: .agentExample))
  }
}
