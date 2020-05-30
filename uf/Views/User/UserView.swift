//
//  UserView.swift
//  uf
//
//  Created by Thomas Leydet on 27/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import Model
import SwiftUI

struct UserView: View {
  @ObservedObject var viewModel : UserViewModel
  
  var body: some View {
    Form {
      Section {
        if self.viewModel.user.id != nil {
          IntCell(title: "ID de l'utilisateur", value: .keyPath(\.user.id, on: self.viewModel), editable: false)
        }
        EnumCell(title: "Type de l'utilisateur", value: .keyPath(\.user.type, on: self.viewModel), editable: self.viewModel.isEditable)
        TextCell(title: "Nom de l'utilisateur", value: .keyPath(\.user.name, on: self.viewModel), editable: self.viewModel.isEditable)
        TextCell(title: "Email de l'utilisateur", value: .keyPath(\.user.email, on: self.viewModel), editable: self.viewModel.isEditable)
        if viewModel.user.id == nil {
          TextCell(title: "Mot de passe de l'utilisateur", value: .keyPath(\.user.password, on: self.viewModel), editable: self.viewModel.isEditable)
        }
        TextCell(title: "Numéro de téléphone de l'utilisateur", value: .keyPath(\.user.phone, on: self.viewModel), editable: self.viewModel.isEditable)
        DateCell(title: "Date de naissance de l'utilisateur", date: .keyPath(\.user.birthdate, on: self.viewModel), isEditable: self.viewModel.isEditable)
        if self.viewModel.user.type == .agent {
          IntCell(title: "Id de l'agence de l'utilisateur", value: .keyPath(\.user.agencyId, on: self.viewModel), editable: self.viewModel.isEditable)
        }
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

struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView(viewModel: UserViewModel(user: .clientExample, currentUser: .agentExample))
    }
  }
}
