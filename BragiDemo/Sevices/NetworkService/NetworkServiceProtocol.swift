//
//  NetworkServiceProtocol.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func data<T: NetworkingRequest>(_ request: T) -> AnyPublisher<Data, NetworkError>
    func json<T: NetworkingRequest>(_ request: T) -> AnyPublisher<T.ResponseType, NetworkError>
}
