//
//  NetworkError.swift
//  EffectiveMobile
//
//  Created by Egor SAUSHKIN on 13.12.2022.
//

import UIKit


enum NetworkError: Error {
    case custom(description: String)
    case parse(reason: String)
    case lostInternet
    case unknown
}
