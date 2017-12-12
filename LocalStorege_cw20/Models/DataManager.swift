//
//  DataManager.swift
//  LocalStorege_cw20
//
//  Created by Sergey Intern  on 12/11/17.
//  Copyright © 2017 Sergey Intern . All rights reserved.
//

import Foundation

final class DataManager {
    
    static let instance = DataManager()
    private init() {}
    
    var lastAppVisitDate: Date? {
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.lastAppVisitStorageKey)
        }
        get {
            return UserDefaults.standard.object(forKey: Constants.lastAppVisitStorageKey) as? Date
        }
    }
    
    var isTutorialCompletedStorageKey: Bool {
        set(newBoolValue) {
            UserDefaults.standard.set(newBoolValue, forKey: Constants.isTutorialCompletedStorageKey)
        }
        get {
            return UserDefaults.standard.bool(forKey: Constants.isTutorialCompletedStorageKey)
        }
    }
}
