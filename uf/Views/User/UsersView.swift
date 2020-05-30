//
//  UsersView.swift
//  uf
//
//  Created by Thomas Leydet on 26/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI
import Model

struct UsersView: View {
  @ObservedObject var viewModel: UsersViewModel
  @State var newUser: User?
  
  var body: some View {
    List {
      ForEach(self.viewModel.users) { user in
        NavigationLink(destination: UserView(viewModel: UserViewModel(user: user, currentUser: self.viewModel.currentUser))) {
          HStack {
            Text(user.name)
            Spacer()
            Text(user.type.description)
              .foregroundColor(.secondary)
              .font(.footnote)
          }
        }
      }.onDelete { indexes in
        self.viewModel.delete(indexes: indexes)
      }.deleteDisabled(!self.viewModel.isEditable)
    }.navigationBarTitle("Utilisateurs").onAppear{
      self.viewModel.getUsers()
    }.navigationBarItems(trailing: Button(action: {
      self.newUser = .empty
    }, label: {
      Image(systemName: "plus")
    }).disabled(!self.viewModel.isEditable)).sheet(item: $newUser, content: { user in
      UserView(viewModel: UserViewModel(user: user, currentUser: self.viewModel.currentUser, onSave: {
        self.newUser = nil
        self.viewModel.getUsers()
      }))
    })
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView(viewModel: UsersViewModel(currentUser: .agentExample, service: UserServiceExampleSuccess()))
  }
}
