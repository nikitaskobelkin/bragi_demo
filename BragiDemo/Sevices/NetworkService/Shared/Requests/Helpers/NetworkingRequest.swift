//
//  NetworkingRequest.swift
//  BragiDemo
//
//  Created by Nikita Skobelkin on 25/07/2023.
//

import Alamofire

protocol NetworkingRequest {
    associatedtype ResponseType: Decodable
    func getRequestDescriptor() -> RequestDescriptor
}
