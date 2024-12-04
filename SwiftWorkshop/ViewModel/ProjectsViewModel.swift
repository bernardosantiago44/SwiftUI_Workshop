//
//  ProjectsViewModel.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 04/12/24.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

@Observable class ProjectsViewModel {
    var projects: [Project] = []
    
    var newProject = Project()
    var showNewProjectSheet = false
    
    private let db = Firestore.firestore()
    
    // Funcion para escribir el proyecto a la base de datos
    private func addProjectToDb(_ project: Project) throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.userAuthenticationRequired)
        }
        
        try db.collection("users/" + user.uid + "/projects").document(project.id).setData(from: project)
        self.projects.append(project)
        self.newProject = Project()
        self.showNewProjectSheet = false
    }
    
    public func uploadProject() {
        do {
            try addProjectToDb(self.newProject)
        } catch {
            print(error.localizedDescription)
        }
    }
}
