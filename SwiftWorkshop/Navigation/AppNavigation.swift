//
//  AppNavigation.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 02/12/24.
//

import SwiftUI

struct AppNavigation: View {
    @State var authViewModel = AuthViewModel()
    @State var projectsViewModel = ProjectsViewModel()
    
    var body: some View {
        VStack {
            if self.authViewModel.user == nil {
                NavigationStack {
                AuthView(authViewModel: self.authViewModel)
                    .navigationTitle("Autenticación")
                }
            } else {
                NavigationStack {
                    ProjectsList(viewModel: self.projectsViewModel)
                }
            }
        }
    }
}

#Preview {
    AppNavigation()
}
