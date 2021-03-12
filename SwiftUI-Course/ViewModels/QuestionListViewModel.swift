//
//  QuestionsViewModel.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import SwiftUI

class QuestionListViewModel: Identifiable, Hashable {
    
    // MARK:- Conformance to identifiable.
    
    let id: UUID = UUID()
    
    // MARK:- Property of Model
    
    let item: Items
    
    // MARK:- Init
    
    init(item: Items) {
        self.item = item
    }
    
    // MARK:- Stored Properties
    
    var title: String {
        if let title = item.title {
            return title
        }
        
        return ""
    }
    
    var views: String {
        if let views = item.viewCount {
            return views.description
        }
        
        return ""
    }
    
    var answerCount: String {
        if let answer = item.answerCount {
            return answer.description
        }
        
        return ""
    }
    
    var scoreCount: String {
        if let score = item.score {
            return score.description
        }
        return ""
    }
    
    var questionId: Int {
        item.questionID
    }
    
    var formattedDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(item.creationDate))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    var textForegroundColor: Color {
        return .white
    }
    
    // MARK:- Settings View Model to compute view color according to the selected theme.
    
    let settingsViewModel = SettingsViewModel()
    
    var answerBlockBackgroundColor: Color {
        return settingsViewModel.setting == 1  ? Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)) : .orange
    }
    
    var votesBlockBackgroundColor: Color {
        return settingsViewModel.setting == 1 ? Color(#colorLiteral(red: 0.1098039216, green: 0.7921568627, blue: 1, alpha: 1)) : .blue
    }
    
    
    var tags: String {
        if let tags = item.tags {
            return tags.joined(separator: ",")
        }
        
        return ""
    }
    
    var ownerName: String {
        item.owner.displayName
    }
    
    var body: String {
        item.body ?? "Unavailable"
    }
    
    static func == (lhs: QuestionListViewModel, rhs: QuestionListViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static var placeholder: QuestionListViewModel {
        return .init(item: Items.placeholder)
    }
}
