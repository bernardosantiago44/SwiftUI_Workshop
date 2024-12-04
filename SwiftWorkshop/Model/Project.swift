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
}

struct Author: Codable {
    var name: String = ""
    var email: String = ""
    var number: String = ""
}
