//
//  FetchHomeSections.swift
//  Dynamya
//
//  Created by Ahmed Shendy on 05/12/2025.
//

import Foundation

// Request

struct FetchHomeSectionsRequest: APIGetRequest {
    typealias Response = FetchHomeSectionsResponse

    var api: URL {
        .init(
            string: "https://api-v2-b2sit6oh3a-uc.a.run.app"
        )!
    }
    var path: String { "/home_sections" }
}

// Response

struct FetchHomeSectionsResponse: APIResponse {
    let sections: [HomeSectionModel]
    let pagination: PaginationModel
}
