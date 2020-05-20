//
//  EstateListView.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model

struct EstateListView: View {
    var viewModel: EstateListViewModel
  
    var body: some View {
      List(viewModel.list) { estate in
        NavigationLink(destination: EstateView()) {
          Text(estate.location)
        }
      }.navigationBarTitle("Biens")
  }
}

struct EstateListView_Previews: PreviewProvider {
    static var previews: some View {
      EstateListView(viewModel: EstateListViewModel())
    }
}
