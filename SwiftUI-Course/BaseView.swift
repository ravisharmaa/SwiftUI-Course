//
//  ContentView.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import SwiftUI

struct BaseView: View {
    var body: some View {
        TabView {
            QuestionsView().tabItem {
                Image(systemName: "list.number")
                Text("Questions")
            }
            
            TagsView().tabItem {
                Image(systemName: "tag")
                Text("Tags")
            }
            
            PeopleView().tabItem {
                Image(systemName: "person.3")
                Text("Users")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person.circle.fill")
                Text("Profile")
            }
            
            SettingsView().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
