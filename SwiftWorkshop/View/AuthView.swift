//
//  AuthView.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct AuthView: View {
    @Bindable var authViewModel: AuthViewModel
    @FocusState private var focus: String?
    
    var body: some View {
        VStack {
            TextField("Email", text: $authViewModel.email)
                .textFieldStyle(RoundedTextFieldStyle())
                .focused($focus, equals: "emailField")
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
            
            SecureField("Contraseña", text: $authViewModel.password)
                .textFieldStyle(RoundedTextFieldStyle())
            
            ViewThatFits {
                HStack {
                    registerButton()
                    loginButton()
                }
                .disabled(self.authViewModel.email.isEmpty || self.authViewModel.password.isEmpty)
                
                VStack {
                    registerButton()
                    loginButton()
                }
                .disabled(self.authViewModel.email.isEmpty || self.authViewModel.password.isEmpty)
            }
        }
        .padding()
    }
    
    @ViewBuilder private func registerButton() -> some View {
        Button {
            Task {
                await self.authViewModel.registerUser()
            }
        } label: {
            Text("Registrarse")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
    }
    
    @ViewBuilder private func loginButton() -> some View {
        Button {
            Task {
                await self.authViewModel.loginWithEmailPassword()
            }
        } label: {
            Text("Iniciar sesion")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
    }
}
