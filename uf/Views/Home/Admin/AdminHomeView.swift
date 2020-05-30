//
//  AdminHomeView.swift
//  uf
//
//  Created by Thomas Leydet on 19/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct AdminHomeView: View {
  @ObservedObject var viewModel: AdminHomeViewModel
  
  var body: some View {
    List {
      NavigationLink(destination: AgenciesView(viewModel: AgenciesViewModel(currentUser: self.viewModel.user)), label: {
        Text("Agences")
      })
      NavigationLink(destination: EstateListView(viewModel: EstateListViewModel(currentUser: viewModel.user)), label: {
        Text("Biens")
      })
      NavigationLink(destination: UsersView(viewModel: UsersViewModel(currentUser: self.viewModel.user)), label: {
        Text("Utilisateurs")
      })
    }.navigationBarTitle("Home admin")
  }
}

struct AdminHomeView_Previews: PreviewProvider {
  static var previews: some View {
    AdminHomeView(viewModel: AdminHomeViewModel(user: .adminExample))
  }
}
