//
//  BaseDataResponseSerializer.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import Alamofire

// MARK: - Base Data Response Serializer

final class BaseDataResponseSerializer: ResponseSerializer {
    func serialize(request: URLRequest?, response: HTTPURLResponse?, data: Data?, error: Error?) throws -> Data {
        let statusCode = response?.statusCode ?? 0
        guard NetworkStatusCode.successCodes.contains(statusCode) else {
            throw AFError.responseValidationFailed(reason: .unacceptableStatusCode(code: statusCode))
        }
        guard let data = data,
              !data.isEmpty,
              let responseData = try? dataPreprocessor.preprocess(data)
        else { return Data() }
        return responseData
    }
}
