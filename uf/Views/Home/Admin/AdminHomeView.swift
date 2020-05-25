//
//  HomeView.swift
//  uf
//
//  Created by Thomas Leydet on 19/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct AdminHomeView: View {
  @ObservedObject var viewModel: AdminHomeViewModel
  
  var body: some View {
    Text("Bonjour \(viewModel.user.name) !")
  }
}

struct AdminHomeView_Previews: PreviewProvider {
  static var previews: some View {
    AdminHomeView(viewModel: AdminHomeViewModel(user: .adminExample))
  }
}
