//
//  QuestionsView.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import SwiftUI


struct QuestionsView: View {
    
    @StateObject var questionsViewModel = QuestionsViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(questionsViewModel.questionListVM, id:\.id) { question in
//                    NavigationLink(destination: QuestionDetailView(viewModel: questionsViewModel, question: question)) {
//                        QuestionCell(question: question)
//                    }
                    NavigationLink(
                        destination: QuestionDetailView(question: question, questionViewModel: questionsViewModel),
                        label: {
                            QuestionCell(question: question)
                        })
                }.onAppear(perform: {
                    questionsViewModel.fetchQuestions()
                })
                
                .navigationTitle("Top Questions")
                .alert(item: $questionsViewModel.error) { (error) in
                    Alert(title: Text(error.errorText))
                }
            }
            
            if questionsViewModel.isLoading {
                ZStack {
                    Color.white.opacity(0.7).ignoresSafeArea()
                    ProgressView("Fetching Questions")
                }
            }
        }
        
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView()
            .colorScheme(.light)
    }
}
