//
//  BlockView.swift
//  SwiftUI-Course
//
//  Created by Javra Software on 2/19/21.
//

import SwiftUI

struct BlockView: View {
    
    let question: QuestionListViewModel
    
    let viewType: BlockViewType
    
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(height: 80)
            .frame(width: 80)
            .foregroundColor(viewType.getBackgroundColor(question: question))
            .overlay(
                VStack(alignment: .center, spacing: 3) {
                    Text(viewType.getOverlayText(question: question))
                        .foregroundColor(.white)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(viewType.description)
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .foregroundColor(question.textForegroundColor)
                
            )
    }
}
