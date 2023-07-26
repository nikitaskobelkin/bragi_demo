//
//  RequestAccessContent.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

enum RequestAccessContent {
    case bearer(apiKey: String)
}

extension RequestAccessContent {
    var rawValue: String {
        switch self {
        case let .bearer(apiKey):
            return "Bearer \(apiKey)"
        }
    }
}
