//
//  AgenciesView.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model

struct AgenciesView: View {
  @ObservedObject var viewModel: AgenciesViewModel
  @State var newAgency: Agency?
  
  var body: some View {
    List {
      ForEach(self.viewModel.agencies) { agency in
        NavigationLink(destination: AgencyView(viewModel: AgencyViewModel(agency: agency, currentUser: self.viewModel.currentUser))) {
          HStack {
            Text(agency.name)
            Spacer()
            Text("\(agency.id ?? 0)")
              .font(.footnote)
              .foregroundColor(.secondary)
          }
        }
      }.onDelete { indexes in
        self.viewModel.delete(indexes: indexes)
      }.deleteDisabled(!self.viewModel.isEditable)
    }.navigationBarItems(trailing: Button(action: {
      self.newAgency = .empty
    }, label: {
      Image(systemName: "plus")
    }).disabled(!self.viewModel.isEditable)).navigationBarTitle("Agences").onAppear{
      self.viewModel.getAgencies()
    }.sheet(item: $newAgency) { agency in
      AgencyView(viewModel: AgencyViewModel(agency: agency, currentUser: self.viewModel.currentUser, onSave: {
        self.newAgency = nil
        self.viewModel.getAgencies()
      }))
    }
  }

struct AgenciesView_Previews: PreviewProvider {
  static var previews: some View {
    AgenciesView(viewModel: AgenciesViewModel(service: AgencyServiceExampleSuccess(), currentUser: .adminExample))
    
    }
  }
}
