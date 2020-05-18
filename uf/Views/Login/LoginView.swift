//
//  LoginView.swift
//  uf
//
//  Created by Thomas Leydet on 18/05/2020.
//  Copyright © 2020 Thomas Leydet. All rights reserved.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject var viewModel: LoginViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.title)
        .font(.largeTitle)
      TextField(viewModel.emailPlaceholder, text: .keyPath(\.email, on: viewModel))
        .multilineTextAlignment(.center)
      SecureField(viewModel.passwordPlaceholder, text: .keyPath(\.password, on: viewModel))
        .multilineTextAlignment(.center)
      if viewModel.error {
        Text(viewModel.errorMessage)
          .foregroundColor(.red)
      }
      Spacer()
        .frame(height: 100)
      Button(action: {
        self.viewModel.login()
      }, label: {
        Text(viewModel.actionTitle)
      })
    }
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    LoginView(viewModel: LoginViewModel(onSuccess: { }))
      .colorScheme(.light)
      .previewLayout(.sizeThatFits)
  }
}
