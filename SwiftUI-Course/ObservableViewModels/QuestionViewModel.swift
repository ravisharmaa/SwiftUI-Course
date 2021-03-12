//
//  QuestionViewModel.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/11/21.
//

import Foundation
import Combine

enum SiteKeys: CustomStringConvertible {
    case name
    case value
    
    var description: String {
        switch self {
        case .name:
            return "site"
        case .value:
            return "lifehacks"
        }
    }
}

struct AppError: Identifiable, Error {
    let id: String = UUID().uuidString
    let errorText: String
}

class QuestionsViewModel: ObservableObject {
    
    private let request = Request()
    
    private var subscription: Set<AnyCancellable> = []
    
    @Published private (set) var questionListVM: [QuestionListViewModel] = []
    
    @Published var error: AppError? = nil
    
    @Published var isLoading: Bool = true
    
    
    func fetchQuestions() {
        
        let queryItems: [URLQueryItem] = [
            .init(name: "order", value: "desc"),
            .init(name: "sort", value: "votes"),
            .init(name: SiteKeys.name.description, value: SiteKeys.value.description)
        ]
        
        request.load(for: Response.self, path: "/questions", queryItems: queryItems)
            .receive(on: RunLoop.main)
            .mapError{[self] (error) -> AppError in
                self.error = AppError(errorText: error.localizedDescription)
                isLoading = false
                return self.error!
            }
            .sink { (_) in
                //
            } receiveValue: { [self] (response) in
                isLoading = false
                questionListVM = response.items.map {QuestionListViewModel.init(item: $0)}
            }.store(in: &subscription)
        
        isLoading = true
    }
    
    func fetchAnswerByQuestion(questionId: Int) {
        
        var queryItems: [URLQueryItem] = [
            .init(name: "order", value: "desc"),
            .init(name: "sort", value: "votes"),
            .init(name: SiteKeys.name.description, value: SiteKeys.value.description)
        ]
        
        request.load(for: Response.self, path: "/questions/\(questionId)/answers", queryItems: queryItems)
            .receive(on: RunLoop.main)
            .sink { (_) in
                //
            } receiveValue: { [self] (response) in
                
                let answerIds = response.items.map { (item) -> String in
                    return item.answerId!.description
                }
                
                fetchAnswerDetailFromAnswerIds(answerIds: answerIds, queryItems: &queryItems)
                
            }.store(in: &subscription)
    }
    
    func fetchAnswerDetailFromAnswerIds(answerIds: [String], queryItems: inout [URLQueryItem]) {
        
        queryItems.append(.init(name: "filter", value: "withbody"))
        
        let path: String = "/answers/" + answerIds.joined(separator: ";")
        
        request.load(for: Response.self, path: path, queryItems: queryItems)
            .receive(on: RunLoop.main)
            .sink { (_) in
                //
            } receiveValue: { (response) in
                print(response.items.first)
                
            }.store(in: &subscription)

        
    }
    
}
