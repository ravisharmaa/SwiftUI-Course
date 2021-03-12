//
//  QuestionCell.swift
//  SwiftUI-Course
//
//  Created by Javra Software on 2/19/21.
//

import SwiftUI

enum BlockViewType: CustomStringConvertible {
    
    case answerBlock
    
    case voteBlock
    
    var description: String {
        switch self {
        case .answerBlock:
            return "answers"
        default:
            return "votes"
        }
    }
    
    func getBackgroundColor(question: QuestionListViewModel) -> Color {
        switch self {
        case .answerBlock:
            return question.answerBlockBackgroundColor
        default:
            return question.votesBlockBackgroundColor
        }
    }
    
    func getOverlayText(question: QuestionListViewModel) -> String {
        switch self {
        case .answerBlock:
            return question.answerCount
        default:
            return question.scoreCount
        }
    }
}

struct QuestionCell: View {
    
    let question: QuestionListViewModel
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(question.title)
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text(question.tags)
                .foregroundColor(.blue)
                .font(.caption)
                .fontWeight(.bold)
            
            HStack(spacing: 15) {
                
                BlockView(question: question, viewType: .voteBlock)
                
                BlockView(question: question, viewType: .answerBlock)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(question.views) Views")
                    Text("Asked on \(question.formattedDate)")
                    Text(question.ownerName)
                }
                .foregroundColor(.gray)
                .font(.caption)
            }
            
        }
        .padding(.vertical, 10)
    }
}
