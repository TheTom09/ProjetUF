//
//  AgencyView.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import SwiftUI

struct AgencyView: View {
  var viewModel: AgencyViewModel
  
  var body: some View {
    Text("Hello, \(viewModel.agency.name)!")
  }
}

struct AgencyView_Previews: PreviewProvider {
  static var previews: some View {
    AgencyView(viewModel: AgencyViewModel(agency: Agency(id: 0, name: "", location: "", phone: "")))
  }
}
