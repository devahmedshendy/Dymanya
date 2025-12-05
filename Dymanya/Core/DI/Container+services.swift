//
//  Container+services.swift
//  PetrojetHSE
//
//  Created by Ahmed Shendy on 14/10/2025.
//  Copyright © 2025 Petrojet. All rights reserved.
//

import FactoryKit

let DI = Container.shared

extension Container {
    var alamofire: Factory<APIClient> {
        self { AlamofireClient() }
    }

    var api: Factory<APIClient> {
        self { self.alamofire() }
    }
}
