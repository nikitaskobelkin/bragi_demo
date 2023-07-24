//
//  NetworkError.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire

// MARK: - Network Error

enum NetworkError: Error {
    case unauthorized
    case invalidJSON
    case alamofireError(error: AFError)
    case invalidError
    case badRequest
    case unprocessableEntity
    case forbidden
    case noConnection
    case custom(Error)
}
