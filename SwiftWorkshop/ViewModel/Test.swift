//
//  Test.swift
//  SwiftWorkshop
//
//  Created by gdaalumno on 05/12/24.
//

import SwiftUI

struct Test: View {
    let cols: [GridItem] = .init(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        
        LazyVGrid(columns: cols, content: {
            ForEach(0..<10) { _ in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 80)
            }
        })
        .padding()
    }
}

#Preview {
    Test()
}
