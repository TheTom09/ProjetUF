//
//  AgenciesView.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct AgenciesView: View {
  var viewModel: AgenciesViewModel
  
  var body: some View {
    List(viewModel.agencies) { agency in
      NavigationLink(destination: AgencyView(viewModel: AgencyViewModel(agency: agency)), label: {
        Text(agency.name)
      })
    }.navigationBarTitle("Agences")
  }
}

struct AgenciesView_Previews: PreviewProvider {
  static var previews: some View {
    AgenciesView(viewModel: AgenciesViewModel())
      .colorScheme(.light)
  }
}
