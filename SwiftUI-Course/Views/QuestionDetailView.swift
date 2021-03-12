//
//  QuestionDetailView.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/10/21.
//

import SwiftUI

struct QuestionDetailView: View {
    
    let question: QuestionListViewModel
    
    @StateObject var questionViewModel: QuestionsViewModel = QuestionsViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            HStack(spacing: 18) {
                VStack(spacing: 8) {
                    Triangle()
                        .fill(Color.orange)
                        .frame(width: 20, height: 20)
                    
                    Text(question.scoreCount)
                        .font(.title)
                        .foregroundColor(.gray)
                    
                    Triangle()
                        .fill(Color.orange)
                        .frame(width: 20, height: 20)
                        .rotationEffect(.degrees(180))
                }
                
                VStack(alignment: .leading,spacing: 5) {
                    HStack {
                        Text(question.title)
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                        
                        Spacer()
                    }
                    
                    Text(question.tags)
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    
                    Text("Asked on \(question.formattedDate)")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text("Viewed, \(question.views) times")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    
                }
            }
            .padding()
            
            HStack {
                Text("Go to accepted answer")
                    .font(.caption)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                Spacer()
            }.padding(.leading, 16)
            
           
            
            Divider()
            
            
            
        }.onAppear {
            questionViewModel.fetchAnswerByQuestion(questionId: question.questionId)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationTitle("Question")
        
        
        
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: .init(x: rect.midX, y: rect.minY));
        path.addLine(to: .init(x: rect.minX, y: rect.maxY))
        path.addLine(to: .init(x: rect.maxX, y: rect.maxY))
        path.addLine(to: .init(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct QuestionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionDetailView(question: QuestionListViewModel.placeholder)
    }
}
