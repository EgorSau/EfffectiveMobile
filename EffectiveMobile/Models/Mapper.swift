//
//  Mapper.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import UIKit

protocol MapperProtocol {
    func parse<T: Decodable>(_ type: T.Type,
                             from data: Data,
                             completion: @escaping (Result<T, NetworkError>) -> Void)
}

final class Mapper {}

extension Mapper: MapperProtocol {
    
    func parse<T: Decodable>(_ type: T.Type,
                             from data: Data,
                             completion: @escaping (Result<T, NetworkError>) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(type, from: data)
            completion(.success(decodedData))
        } catch let error {
            completion(.failure(.parse(reason: error.localizedDescription)))
        }
    }
}
