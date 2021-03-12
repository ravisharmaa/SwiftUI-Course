//
//  SettingsViewModel.swift
//  SwiftUI-Course
//
//  Created by Javra Software on 2/12/21.
//

import Foundation
import SwiftUI


class SettingsViewModel: ObservableObject {
    
    public enum Setting: Int {
        case defaultSetting
        case webSetting
    }
    
    @AppStorage ("setting") var setting:  Int = Setting.defaultSetting.rawValue
    
    @Published var settingValue: Int = UserDefaults.standard.integer(forKey: "setting")
    
    @Published var showSettingAlert: Bool = false
    
    func changePreferences(_ to: Setting) {
        setting = to.rawValue
    }
}
