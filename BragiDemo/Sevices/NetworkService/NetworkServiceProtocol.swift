//
//  NetworkServiceProtocol.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Foundation
import RxSwift

protocol NetworkServiceProtocol {
    func data<T: NetworkingRequest>(_ request: T) -> Observable<Result<Data, NetworkError>>
    func json<T: NetworkingRequest>(_ request: T) -> Observable<Result<T.ResponseType, NetworkError>>
}
