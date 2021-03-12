//
//  SettingsView.swift
//  SwiftUI-Course
//
//  Created by Ravi Bastola on 2/7/21.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject var settingsViewModel: SettingsViewModel = SettingsViewModel()
    
    var alertView: Alert {
        Alert(title: Text("Settings Changed!"), message: Text("Default Setting Applied"), dismissButton: .default(Text("Close")))
    }
    
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("App Theme").font(.caption).padding()) {
                    
                    HStack(spacing: 5) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Default")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("monkey, wheel, whale, round")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 80)
                                    .frame(width: 80)
                                    .foregroundColor(.blue)
                                    .overlay(
                                        VStack(alignment: .center, spacing: 3) {
                                            Text("220")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("votes")
                                                .foregroundColor(.white)
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                        }
                                        
                                    )
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.orange, lineWidth: 2)
                                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.orange))
                                    .frame(height: 80)
                                    .frame(width: 80)
                                    .overlay(
                                        VStack(alignment: .center, spacing: 3) {
                                            Text("500")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("answers")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                        }
                                        .foregroundColor(.white)
                                    )
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("999 Views")
                                    Text("Asked on 29 Sept 2019")
                                    Text("Username")
                                }
                                .foregroundColor(.gray)
                                .font(.caption)
                            }
                        }
                        
                        if settingsViewModel.settingValue == 0 {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                        
                        
                    }
                    .padding(.vertical, 10)
                    .onTapGesture(perform: {
                        settingsViewModel.settingValue = 0
                        settingsViewModel.changePreferences(.defaultSetting)
                        settingsViewModel.showSettingAlert.toggle()
                        
                    })
                    .alert(isPresented: $settingsViewModel.showSettingAlert) {
                       alertView
                    }
                    
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Web")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            Text("monkey, wheel, whale, round")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                            HStack(spacing: 15) {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(height: 80)
                                    .frame(width: 80)
                                    .foregroundColor(Color(#colorLiteral(red: 0.1098039216, green: 0.7921568627, blue: 1, alpha: 1)))
                                    .overlay(
                                        VStack(alignment: .center, spacing: 3) {
                                            Text("220")
                                                .foregroundColor(.white)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("votes")
                                                .foregroundColor(.white)
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                        }
                                        
                                    )
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
                                    .frame(height: 80)
                                    .frame(width: 80)
                                    .overlay(
                                        VStack(alignment: .center, spacing: 3) {
                                            Text("500")
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text("answers")
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                        }
                                        .foregroundColor(.white)
                                    )
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text("999 Views")
                                    Text("Asked on 29 Sept 2019")
                                    Text("Username")
                                }
                                .foregroundColor(.gray)
                                .font(.caption)
                            }
                        }
                        
                        if settingsViewModel.settingValue == 1 {
                            Image(systemName: "checkmark")
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.vertical, 10)
                    .onTapGesture(perform: {
                        settingsViewModel.settingValue = 1
                        settingsViewModel.changePreferences(.webSetting)
                        settingsViewModel.showSettingAlert.toggle()
                    })
                    .alert(isPresented: $settingsViewModel.showSettingAlert) {
                       alertView
                    }
                    
                }
                
            }.navigationTitle("Settings")
        }
    }
}




struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
