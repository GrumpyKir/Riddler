//
//  AppConfiguration.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import Foundation

enum AppConfiguration {
    
    static var databaseContainerName: String {
        return "Riddler"
    }
    
    static var serverUrl: String {
        return "http://192.168.30.39:8000"
    }
    
    static var serverApi: String {
        return AppConfiguration.serverUrl + "/api"
    }
    
}
