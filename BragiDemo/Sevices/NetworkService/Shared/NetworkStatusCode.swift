//
//  NetworkStatusCode.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

struct NetworkStatusCode {
    static let successCodes: Range<Int> = 200..<300
    static let badRequest: Int = 400
    static let unauthorizeCode: Int = 401
    static let forbidden: Int = 403
    static let notFoundCode: Int = 404
}
