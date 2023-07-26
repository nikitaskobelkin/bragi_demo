//
//  Result+.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation

extension Result {
    var successValue: Success? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
}
