//
//  RiddlerRepository.swift
//  Arcana
//
//  Created by  Кирилл on 10/26/19.
//  Copyright © 2019 AppCraft. All rights reserved.
//

import GKUseCase

public class RiddlerRepository: Repository {
    
    init() {
        super.init(modelName: AppConfiguration.databaseContainerName)
    }
    
}
