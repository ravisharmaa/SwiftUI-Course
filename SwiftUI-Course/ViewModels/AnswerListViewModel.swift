//
//  AnswerListViewModel.swift
//  SwiftUI-Course
//
//  Created by Javra Software on 2/22/21.
//

import Foundation

class AnswerListViewModel: Identifiable, Hashable {
    
    let item: Items
    
    init(item: Items) {
        self.item = item
    }
    
    
    static func == (lhs: AnswerListViewModel, rhs: AnswerListViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    let id: UUID = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    
}
