//
//  EstateView.swift
//  uf
//
//  Created by Thomas Leydet on 20/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import SwiftUI

struct EstateView: View {
  @ObservedObject var viewModel: EstateViewModel
  
  var body: some View {
    Form {
      Section {
        if self.viewModel.estate.id != nil {
          IntCell(title: "ID de du bien", value: .keyPath(\.estate.id, on: self.viewModel), editable: false)
        }
        if self.viewModel.currentUser.type == .admin {
          IntCell(title: "Id de l'agence", value: .keyPath(\.estate.agencyId, on: self.viewModel), editable: self.viewModel.isEditable)
        }
        IntCell(title: "Id du vendeur de l'annonce", value: .keyPath(\.estate.clientId, on: self.viewModel), editable: self.viewModel.isEditable)
        EnumCell(title: "Status", value: .keyPath(\.estate.status, on: self.viewModel), editable: self.viewModel.isEditable)
      }
      Section {
        TextCell(title: "Localisation", value: .keyPath(\.estate.location, on: self.viewModel), editable: self.viewModel.isEditable)
        EnumCell(title: "Type", value: .keyPath(\.estate.type, on: self.viewModel), editable: self.viewModel.isEditable)
        IntCell(title: "Surface", value:
          .keyPath(\.estate.surface, on: self.viewModel), suffix: "m²", editable: self.viewModel.isEditable)
        IntCell(title: "Pièces à vivre", value: .keyPath(\.estate.rooms, on: self.viewModel), editable: self.viewModel.isEditable)
        IntCell(title: "Etage du bien", value: .keyPath(\.estate.floor, on: self.viewModel), editable: self.viewModel.isEditable)
      }
      Section {
        EnumCell(title: "Les plus du bien", value: .keyPath(\.estate.outbuildings, on: self.viewModel), editable: self.viewModel.isEditable)
        IntCell(title: "Prix minimum", value: .keyPath(\.estate.minimumPrice, on: self.viewModel), suffix: "€", editable: self.viewModel.isEditable)
        IntCell(title: "Prix maximum", value: .keyPath(\.estate.maximumPrice, on: self.viewModel), suffix: "€", editable: self.viewModel.isEditable)
        IntCell(title: "Prix", value: .keyPath(\.estate.price, on: self.viewModel), suffix: "€", editable: self.viewModel.isEditable)
        IntCell(title: "Frais d'agence", value: .keyPath(\.estate.fees, on: self.viewModel), suffix: "€", editable: self.viewModel.isEditable)
      }
      if self.viewModel.isEditable {
        Section {
          Button(action: {
            self.viewModel.saveEstate()
          }, label: {
            Text("Enregistrer")
          }).disabled(!self.viewModel.isValid)
        }
      }
    }
  }

struct EstateView_Previews: PreviewProvider {
  static var previews: some View {
    EstateView(viewModel: EstateViewModel(estate: .estateExample, currentUser: .adminExample))
    }
  }
}

struct EstateFormView: View {
  @State var localisation: String = ""
  @State var type: EstateType = .house
  
  var body: some View {
    Form {
      HStack {
        Text("Localisation")
        TextField("Localisation", text: $localisation)
      }
      Picker(selection: $type, label: Text("Type?"), content: {
        ForEach(EstateType.allCases, id: \.rawValue, content: { type in
          Text(type.description)
        })
      })
    }
  }
}

struct EstateFormView_Previews: PreviewProvider {
  static var previews: some View {
    EstateFormView()
    }
  }

