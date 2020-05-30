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
  @ObservedObject var viewModel: EstateListViewModel
  @State var newEstate: Estate?
  
  var body: some View {
    List {
      ForEach(self.viewModel.estates) { estate in
        NavigationLink(destination: EstateView(viewModel: EstateViewModel(estate: estate, currentUser: self.viewModel.currentUser))) {
          Text(estate.location)
        }
      }.onDelete { indexSet in
        self.viewModel.deleteEstate(indexes: indexSet)
      }
    }.onAppear{
      self.viewModel.getEstates()
    }.navigationBarTitle("Biens").navigationBarItems(trailing: Button(action: {
      self.newEstate = self.viewModel.newEstate()
    }, label: {
      Image(systemName: "plus")
    })).sheet(item: $newEstate, content: { estate in
      EstateView(viewModel: EstateViewModel(estate: estate, currentUser: self.viewModel.currentUser, onSave: {
        self.newEstate = nil
        self.viewModel.getEstates()
      }))
    })
  }
}

struct EstateListView_Previews: PreviewProvider {
  static var previews: some View {
    EstateListView(viewModel: EstateListViewModel(currentUser: .adminExample, service: EstateServiceExampleSuccess()))
  }
}
