//
//  ProjectsList.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 04/12/24.
//

import SwiftUI

struct ProjectsList: View {
    @Bindable var viewModel: ProjectsViewModel
    
    var body: some View {
        List {
            // Projects go here
            ForEach(viewModel.filteredProjects) { project in
                ProjectPreview(project: project)
                    .swipeActions {
                        Button(role: .destructive) {
                            viewModel.removeProject(project)
                        } label: {
                            Text("Eliminar")
                        }
                        
                        Button {
                            viewModel.newProject = Project(project: project)
                            viewModel.uploadProject(updateList: false)
                            
                            if let index = self.viewModel.projects.firstIndex(where: { $0.id == project.id }) {
                                self.viewModel.projects[index].inProgress.toggle()
                            }
                        } label: {
                            Text(project.inProgress ? "Completo" : "En progreso")
                        }
                    }
            }
        }
        .searchable(text: $viewModel.searching)
        .task {
            await viewModel.downloadProjects()
        }
        .refreshable {
            await viewModel.downloadProjects()
        }
        .navigationTitle("Proyectos")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    self.viewModel.showNewProjectSheet = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                }

            }
        }
        .sheet(isPresented: $viewModel.showNewProjectSheet, content: {
            NavigationStack {
                NewProjectForm(newProject: $viewModel.newProject)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            cancelButton()
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            createButton()
                        }
                    }
            }
        })
    }
    
    @ViewBuilder private func cancelButton() -> some View {
        Button("Cancelar", role: .destructive) {
            self.viewModel.showNewProjectSheet = false
        }
    }
    
    @ViewBuilder private func createButton() -> some View {
        Button("Agregar") {
            self.viewModel.uploadProject()
        }
    }
}
