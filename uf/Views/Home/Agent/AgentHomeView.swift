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
    Text("Hello \(viewModel.user.name) !")
  }
}

struct AgentHomeView_Previews: PreviewProvider {
  static var previews: some View {
    AgentHomeView(viewModel: AgentHomeViewModel(user: .agentExample))
  }
}
