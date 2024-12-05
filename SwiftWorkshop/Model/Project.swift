//
//  Project.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 04/12/24.
//

import Foundation

struct Project: Identifiable, Codable {
    var id: String
    
    var title: String
    var description: String
    var startDate: Date
    var inProgress: Bool
    var author: Author
    
    init() {
        self.title = ""
        self.description = ""
        self.startDate = Date.now
        self.inProgress = true
        self.author = Author()
        
        self.id = UUID().uuidString
    }
    
    // For preview purposes only
    init(title: String, description: String, inProgress: Bool) {
        self.title = title
        self.description = description
        self.inProgress = inProgress
        
        self.author = Author()
        self.id = UUID().uuidString
        self.startDate = .now
    }
    
    init(project: Project) {
        self.title = project.title
        self.description = project.description
        self.startDate = project.startDate
        self.inProgress = !project.inProgress
        self.author = project.author
        
        self.id = project.id
    }
}

struct Author: Codable {
    var name: String = ""
    var email: String = ""
    var number: String = ""
}
