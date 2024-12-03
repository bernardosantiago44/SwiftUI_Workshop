//
//  AuthViewModel.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 03/12/24.
//

import SwiftUI
import FirebaseAuth

@Observable class AuthViewModel {
    var email: String
    var password: String
    
    var user: User?
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        self.email = ""
        self.password = ""
        self.user = nil
        registerAuthStateHandler()
    }
    
    private func registerAuthStateHandler() {
        if self.authStateHandle == nil {
            self.authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
                self?.user = user
            }
        }
    }
    
    deinit {
        self.authStateHandle = nil
    }
    
    public func registerUser() async {
        do {
            try await Auth.auth().createUser(withEmail: self.email, password: self.password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func loginWithEmailPassword() async {
        do {
            try await Auth.auth().signIn(withEmail: self.email, password: self.password)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
