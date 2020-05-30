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
  @ObservedObject var viewModel : AgencyViewModel
  
  var body: some View {
    Form {
      Section {
        if self.viewModel.agency.id != nil {
          IntCell(title: "ID de de l'agence", value: .keyPath(\.agency.id, on: self.viewModel), editable: false)
        }
        TextCell(title: "Localisation de l'agence", value: .keyPath(\.agency.location, on: self.viewModel), editable: self.viewModel.isEditable)
        TextCell(title: "Nom de l'agence", value: .keyPath(\.agency.name, on: self.viewModel), editable: self.viewModel.isEditable)
        TextCell(title: "Numéro de téléphone de l'agence", value: .keyPath(\.agency.phone, on: self.viewModel), editable: self.viewModel.isEditable)
      }
      if self.viewModel.isEditable {
        Section {
          Button(action: {
            self.viewModel.save()
          }, label: {
            Text("Enregistrer")
          }).disabled(!self.viewModel.isValid)
        }
      }
    }
  }

struct AgencyView_Previews: PreviewProvider {
  static var previews: some View {
    AgencyView(viewModel: AgencyViewModel(agency: .agencyExample, currentUser: .adminExample))
    }
  }
}
