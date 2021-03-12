//
//  LoginView.swift
//  SwiftUI-Course
//
//  Created by Javra Software on 2/11/21.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Life Hacks")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
            
                Rectangle()
                    .foregroundColor(.accentColor)
                    .frame(height: 80)
                    .frame(maxWidth: .infinity)
                    .clipShape(Capsule())
                    .padding()
                    .overlay(Text("Log in")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white))
                    .offset(y: -40)
                    .onTapGesture {
                        
                    }
                    
            
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .colorScheme(.dark)
    }
}
